require 'json'

module Fluent
  class FlattenChadinOutput < Output
    include Fluent::HandleTagNameMixin
    class Error < StandardError; end

    Fluent::Plugin.register_output('flatten_chadin', self)

    def configure(conf)
      super

      if (
          !remove_tag_prefix &&
          !remove_tag_suffix &&
          !add_tag_prefix    &&
          !add_tag_suffix
      )
        raise ConfigError, "out_flatten_chadin: At least one of remove_tag_prefix/remove_tag_suffix/add_tag_prefix/add_tag_suffix is required to be set"
      end
    end

    def emit(tag, es, chain)
      es.each do |time, record|
        record.each do |key, value|
          flattened = {}
          flattened[key] = value
          tag_with_key = [tag.clone, key].join('.')
          filter_record(tag_with_key, time, flattened)
          #$stderr.puts "out_flatten_chadin: #{tag_with_key}:  #{value}"

          Engine.emit(tag_with_key, time, flattened)
        end
      end

      chain.next
    end

  end
end
