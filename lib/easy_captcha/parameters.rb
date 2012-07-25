module ActionDispatch
  module Http
    module Parameters
      private

      # TODO: Validate that the characters are UTF-8. If they aren't,
      # you'll get a weird error down the road, but our form handling
      # should really prevent that from happening
      def encode_params(params)
        return params unless "ruby".encoding_aware?

        if params.is_a?(String)
          return params.dup.force_encoding("UTF-8").encode!
        elsif !params.is_a?(Hash)
          return params
        end

        params.each do |k, v|
          case v
          when Hash
            encode_params(v)
          when Array
            v.map! {|el| encode_params(el) }
          else
            encode_params(v)
          end
        end
      end
		end
	end
end