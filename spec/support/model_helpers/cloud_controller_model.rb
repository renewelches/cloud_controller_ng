module ModelHelpers
  def self.relation_types
    relations = []
    %w[one many].each do |cardinality_left|
      %w[zero_or_more zero_or_one one one_or_more].each do |cardinality_right|
         relations << "#{cardinality_left}_to_#{cardinality_right}".to_sym
       end
    end
    relations
  end

  shared_examples "a CloudController model" do |opts|
    # the later code is simplified if we can assume that these are always
    # arrays
    relation_types = ModelHelpers.relation_types
    ([:required_attributes, :unique_attributes, :stripped_string_attributes,
     :sensitive_attributes, :extra_json_attributes, :disable_examples] +
     relation_types).each do |k|
       opts[k] ||= []
       opts[k] = Array[opts[k]] unless opts[k].respond_to?(:each)
     end

    include_examples "model instance", opts
    include_examples "model relationships", opts
    include_examples "model enumeration", opts
  end
end
