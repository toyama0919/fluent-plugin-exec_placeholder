require 'erb'

module Fluent
  class ExecPlaceholderOutput < Output
    Fluent::Plugin.register_output('exec_placeholder', self)
    PLACEHOLDER_REGEXP = /\$\{([^}]+)\}/
    ERB_REGEXP = "<%=record['" + '\1' + "'] %>"

    desc 'The command (program) to execute.'
    config_param :command, :string

    def initialize
      super
    end

    def configure(conf)
      super
      @erb = ERB.new(@command.gsub(PLACEHOLDER_REGEXP, ERB_REGEXP))
    end

    def format(tag, time, record)
      [tag, time, record].to_msgpack
    end

    def emit(tag, es, chain)
      es.each {|time, record|
        prog = @erb.result(binding)
        system(prog)
        ecode = $?.to_i
        if ecode != 0
          raise "command returns #{ecode}: #{prog}"
        end
      }
      chain.next
    end
  end
end
