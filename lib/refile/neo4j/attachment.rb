module Refile
  module Neo4j
    module Attachment
      include Refile::Attachment

      # Attachment method which hooks into Neo4j::ActiveNode models
      #
      # @param [true, false] destroy  Whether to remove the stored file if its model is destroyed
      # @return [void]
      # @see Refile::Attachment#attachment
      def attachment(name, raise_errors: false, destroy: true, **options)
        super(name, raise_errors: raise_errors, **options)

        attacher = :"#{name}_attacher"
        property :"#{name}_id", type: String

        validate do
          if send(attacher).present?
            send(attacher).valid?
            send(attacher).errors.each do |error|
              errors.add(name, error)
            end
          end
        end

        define_method "#{name}=" do |value|
          send("#{name}_id_will_change!")
          super(value)
        end

        define_method "remove_#{name}=" do |value|
          send("#{name}_id_will_change!")
          super(value)
        end

        define_method "remote_#{name}_url=" do |value|
          send("#{name}_id_will_change!")
          super(value)
        end

        before_save do
          send(attacher).store!
        end

        after_destroy do
          send(attacher).delete! if destroy
        end
      end

    end
  end
end
