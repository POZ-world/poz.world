# frozen_string_literal: true

class SerializableApplicationRecord < ApplicationRecord
  self.abstract_class = true

  # Returns a hash representing the model. Some configuration can be
  # passed through +options+.
  #
  # The option <tt>include_root_in_json</tt> controls the top-level behavior
  # of +as_json+. If +true+, +as_json+ will emit a single root node named
  # after the object's type. The default value for <tt>include_root_in_json</tt>
  # option is +false+.
  #
  #   user = User.find(1)
  #   user.as_json
  #   # => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
  #   #     "created_at" => "2006-08-01T17:27:133.000Z", "awesome" => true}
  #
  #   ActiveRecord::Base.include_root_in_json = true
  #
  #   user.as_json
  #   # => { "user" => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
  #   #                  "created_at" => "2006-08-01T17:27:13.000Z", "awesome" => true } }
  #
  # This behavior can also be achieved by setting the <tt>:root</tt> option
  # to +true+ as in:
  #
  #   user = User.find(1)
  #   user.as_json(root: true)
  #   # => { "user" => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
  #   #                  "created_at" => "2006-08-01T17:27:13.000Z", "awesome" => true } }
  #
  # If you prefer, <tt>:root</tt> may also be set to a custom string key instead as in:
  #
  #   user = User.find(1)
  #   user.as_json(root: "author")
  #   # => { "author" => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
  #   #                  "created_at" => "2006-08-01T17:27:13.000Z", "awesome" => true } }
  #
  # Without any +options+, the returned Hash will include all the model's
  # attributes.
  #
  #   user = User.find(1)
  #   user.as_json
  #   # => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
  #   #      "created_at" => "2006-08-01T17:27:13.000Z", "awesome" => true}
  #
  # The <tt>:only</tt> and <tt>:except</tt> options can be used to limit
  # the attributes included, and work similar to the +attributes+ method.
  #
  #   user.as_json(only: [:id, :name])
  #   # => { "id" => 1, "name" => "Konata Izumi" }
  #
  #   user.as_json(except: [:id, :created_at, :age])
  #   # => { "name" => "Konata Izumi", "awesome" => true }
  #
  # To include the result of some method calls on the model use <tt>:methods</tt>:
  #
  #   user.as_json(methods: :permalink)
  #   # => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
  #   #      "created_at" => "2006-08-01T17:27:13.000Z", "awesome" => true,
  #   #      "permalink" => "1-konata-izumi" }
  #
  # To include associations use <tt>:include</tt>:
  #
  #   user.as_json(include: :posts)
  #   # => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
  #   #      "created_at" => "2006-08-01T17:27:13.000Z", "awesome" => true,
  #   #      "posts" => [ { "id" => 1, "author_id" => 1, "title" => "Welcome to the weblog" },
  #   #                   { "id" => 2, "author_id" => 1, "title" => "So I was thinking" } ] }
  #
  # Second level and higher order associations work as well:
  #
  #   user.as_json(include: { posts: {
  #                              include: { comments: {
  #                                             only: :body } },
  #                              only: :title } })
  #   # => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
  #   #      "created_at" => "2006-08-01T17:27:13.000Z", "awesome" => true,
  #   #      "posts" => [ { "comments" => [ { "body" => "1st post!" }, { "body" => "Second!" } ],
  #   #                     "title" => "Welcome to the weblog" },
  #   #                   { "comments" => [ { "body" => "Don't think too hard" } ],
  #   #                     "title" => "So I was thinking" } ] }
  def as_json(options = nil)
    root = if options&.key?(:root)
             options[:root]
           else
             include_root_in_json
           end

    hash = serializable_hash(options).as_json
    if root
      root = model_name.element if root == true
      { root => hash }
    else
      hash
    end
  end
end
