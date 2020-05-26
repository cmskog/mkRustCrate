def all_dependencies:
  .["dependencies", "dev-dependencies", "build-dependencies"];

def optional_dependencies:
  [ all_dependencies | objects | map_values(select(.optional?==true)) ]
  | add // {};

def augment_features:
  .features = (.features + optional_dependencies);

def remove_dependencies:
  del(all_dependencies)
  | .target |= ((.//{}) | map_values(del(all_dependencies)));

def remove_feature_dependencies:
  .features |= map_values([]);

augment_features
  | remove_feature_dependencies
  | remove_dependencies
