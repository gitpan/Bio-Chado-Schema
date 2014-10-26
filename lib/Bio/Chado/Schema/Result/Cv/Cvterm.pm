package Bio::Chado::Schema::Result::Cv::Cvterm;
BEGIN {
  $Bio::Chado::Schema::Result::Cv::Cvterm::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Cv::Cvterm::VERSION = '0.08100';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("cvterm");


__PACKAGE__->add_columns(
  "cvterm_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "cvterm_cvterm_id_seq",
  },
  "cv_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "definition",
  { data_type => "text", is_nullable => 1 },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "is_obsolete",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "is_relationshiptype",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("cvterm_id");
__PACKAGE__->add_unique_constraint("cvterm_c2", ["dbxref_id"]);
__PACKAGE__->add_unique_constraint("cvterm_c1", ["name", "cv_id", "is_obsolete"]);


__PACKAGE__->has_many(
  "acquisitionprops",
  "Bio::Chado::Schema::Result::Mage::Acquisitionprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "acquisition_relationships",
  "Bio::Chado::Schema::Result::Mage::AcquisitionRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "analysisfeatureprops",
  "Bio::Chado::Schema::Result::Companalysis::Analysisfeatureprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "analysisprops",
  "Bio::Chado::Schema::Result::Companalysis::Analysisprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "arraydesign_platformtypes",
  "Bio::Chado::Schema::Result::Mage::Arraydesign",
  { "foreign.platformtype_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "arraydesign_substratetypes",
  "Bio::Chado::Schema::Result::Mage::Arraydesign",
  { "foreign.substratetype_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "arraydesignprops",
  "Bio::Chado::Schema::Result::Mage::Arraydesignprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "assayprops",
  "Bio::Chado::Schema::Result::Mage::Assayprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterialprops",
  "Bio::Chado::Schema::Result::Mage::Biomaterialprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterial_relationships",
  "Bio::Chado::Schema::Result::Mage::BiomaterialRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterial_treatments",
  "Bio::Chado::Schema::Result::Mage::BiomaterialTreatment",
  { "foreign.unittype_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_cvterms",
  "Bio::Chado::Schema::Result::CellLine::CellLineCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_cvtermprops",
  "Bio::Chado::Schema::Result::CellLine::CellLineCvtermprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_lineprops",
  "Bio::Chado::Schema::Result::CellLine::CellLineprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_relationships",
  "Bio::Chado::Schema::Result::CellLine::CellLineRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "contacts",
  "Bio::Chado::Schema::Result::Contact::Contact",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "contact_relationships",
  "Bio::Chado::Schema::Result::Contact::ContactRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "controls",
  "Bio::Chado::Schema::Result::Mage::Control",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvprops",
  "Bio::Chado::Schema::Result::Cv::Cvprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "cv",
  "Bio::Chado::Schema::Result::Cv::Cv",
  { cv_id => "cv_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::Result::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "cvterm_dbxrefs",
  "Bio::Chado::Schema::Result::Cv::CvtermDbxref",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvtermpath_types",
  "Bio::Chado::Schema::Result::Cv::Cvtermpath",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvtermpath_objects",
  "Bio::Chado::Schema::Result::Cv::Cvtermpath",
  { "foreign.object_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvtermpath_subjects",
  "Bio::Chado::Schema::Result::Cv::Cvtermpath",
  { "foreign.subject_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvtermprop_types",
  "Bio::Chado::Schema::Result::Cv::Cvtermprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvtermprops",
  "Bio::Chado::Schema::Result::Cv::Cvtermprop",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvterm_relationship_types",
  "Bio::Chado::Schema::Result::Cv::CvtermRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvterm_relationship_objects",
  "Bio::Chado::Schema::Result::Cv::CvtermRelationship",
  { "foreign.object_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvterm_relationship_subjects",
  "Bio::Chado::Schema::Result::Cv::CvtermRelationship",
  { "foreign.subject_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvtermsynonym_types",
  "Bio::Chado::Schema::Result::Cv::Cvtermsynonym",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvtermsynonyms",
  "Bio::Chado::Schema::Result::Cv::Cvtermsynonym",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "dbxrefprops",
  "Bio::Chado::Schema::Result::Cv::Dbxrefprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Result::Mage::Element",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "element_relationships",
  "Bio::Chado::Schema::Result::Mage::ElementRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "elementresult_relationships",
  "Bio::Chado::Schema::Result::Mage::ElementresultRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "environment_cvterms",
  "Bio::Chado::Schema::Result::Genetic::EnvironmentCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "expression_cvterm_cvterms",
  "Bio::Chado::Schema::Result::Expression::ExpressionCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "expression_cvterm_cvterm_types",
  "Bio::Chado::Schema::Result::Expression::ExpressionCvterm",
  { "foreign.cvterm_type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "expression_cvtermprops",
  "Bio::Chado::Schema::Result::Expression::ExpressionCvtermprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "expressionprops",
  "Bio::Chado::Schema::Result::Expression::Expressionprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "features",
  "Bio::Chado::Schema::Result::Sequence::Feature",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_cvterms",
  "Bio::Chado::Schema::Result::Sequence::FeatureCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_cvtermprops",
  "Bio::Chado::Schema::Result::Sequence::FeatureCvtermprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_expressionprops",
  "Bio::Chado::Schema::Result::Expression::FeatureExpressionprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_genotypes",
  "Bio::Chado::Schema::Result::Genetic::FeatureGenotype",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featuremaps",
  "Bio::Chado::Schema::Result::Map::Featuremap",
  { "foreign.unittype_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featureprops",
  "Bio::Chado::Schema::Result::Sequence::Featureprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_pubprops",
  "Bio::Chado::Schema::Result::Sequence::FeaturePubprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_relationships",
  "Bio::Chado::Schema::Result::Sequence::FeatureRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_relationshipprops",
  "Bio::Chado::Schema::Result::Sequence::FeatureRelationshipprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "libraries",
  "Bio::Chado::Schema::Result::Library::Library",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "library_cvterms",
  "Bio::Chado::Schema::Result::Library::LibraryCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "libraryprops",
  "Bio::Chado::Schema::Result::Library::Libraryprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiments",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperiment",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experimentprops",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_stocks",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentStock",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_stockprops",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentStockprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_geolocationprops",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdGeolocationprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_protocolprops",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_protocol_reagents",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolReagent",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_reagents",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdReagent",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_reagentprops",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdReagentprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_reagent_relationships",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdReagentRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "organismprops",
  "Bio::Chado::Schema::Result::Organism::Organismprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phendescs",
  "Bio::Chado::Schema::Result::Genetic::Phendesc",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenotype_assays",
  "Bio::Chado::Schema::Result::Phenotype::Phenotype",
  { "foreign.assay_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenotype_attrs",
  "Bio::Chado::Schema::Result::Phenotype::Phenotype",
  { "foreign.attr_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenotype_observables",
  "Bio::Chado::Schema::Result::Phenotype::Phenotype",
  { "foreign.observable_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenotype_cvalues",
  "Bio::Chado::Schema::Result::Phenotype::Phenotype",
  { "foreign.cvalue_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenotype_comparison_cvterms",
  "Bio::Chado::Schema::Result::Genetic::PhenotypeComparisonCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenotype_cvterms",
  "Bio::Chado::Schema::Result::Phenotype::PhenotypeCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Result::Genetic::Phenstatement",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phylonodes",
  "Bio::Chado::Schema::Result::Phylogeny::Phylonode",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phylonodeprops",
  "Bio::Chado::Schema::Result::Phylogeny::Phylonodeprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phylonode_relationships",
  "Bio::Chado::Schema::Result::Phylogeny::PhylonodeRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phylotrees",
  "Bio::Chado::Schema::Result::Phylogeny::Phylotree",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "projectprops",
  "Bio::Chado::Schema::Result::Project::Projectprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "project_relationships",
  "Bio::Chado::Schema::Result::Project::ProjectRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "protocols",
  "Bio::Chado::Schema::Result::Mage::Protocol",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "protocolparam_unittypes",
  "Bio::Chado::Schema::Result::Mage::Protocolparam",
  { "foreign.unittype_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "protocolparam_datatypes",
  "Bio::Chado::Schema::Result::Mage::Protocolparam",
  { "foreign.datatype_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "pubs",
  "Bio::Chado::Schema::Result::Pub::Pub",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "pubprops",
  "Bio::Chado::Schema::Result::Pub::Pubprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "pub_relationships",
  "Bio::Chado::Schema::Result::Pub::PubRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "quantificationprops",
  "Bio::Chado::Schema::Result::Mage::Quantificationprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "quantification_relationships",
  "Bio::Chado::Schema::Result::Mage::QuantificationRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stocks",
  "Bio::Chado::Schema::Result::Stock::Stock",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stockcollections",
  "Bio::Chado::Schema::Result::Stock::Stockcollection",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stockcollectionprops",
  "Bio::Chado::Schema::Result::Stock::Stockcollectionprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_cvterms",
  "Bio::Chado::Schema::Result::Stock::StockCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_cvtermprops",
  "Bio::Chado::Schema::Result::Stock::StockCvtermprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_dbxrefprops",
  "Bio::Chado::Schema::Result::Stock::StockDbxrefprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stockprops",
  "Bio::Chado::Schema::Result::Stock::Stockprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_relationships",
  "Bio::Chado::Schema::Result::Stock::StockRelationship",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_relationship_cvterms",
  "Bio::Chado::Schema::Result::Stock::StockRelationshipCvterm",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "studydesignprops",
  "Bio::Chado::Schema::Result::Mage::Studydesignprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "studyfactors",
  "Bio::Chado::Schema::Result::Mage::Studyfactor",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "studyprops",
  "Bio::Chado::Schema::Result::Mage::Studyprop",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "studyprop_features",
  "Bio::Chado::Schema::Result::Mage::StudypropFeature",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "synonyms",
  "Bio::Chado::Schema::Result::Sequence::Synonym",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "treatments",
  "Bio::Chado::Schema::Result::Mage::Treatment",
  { "foreign.type_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:14:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YH+JI3dtFVCrcEkXYthGRA

use Carp;


__PACKAGE__->has_many(
  "cvtermprops",
  "Bio::Chado::Schema::Result::Cv::Cvtermprop",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "cvtermsynonyms",
  "Bio::Chado::Schema::Result::Cv::Cvtermsynonym",
  { "foreign.cvterm_id" => "self.cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);



sub add_synonym {
    my ($self, $synonym, $opts) = @_;
    my $schema = $self->result_source->schema;
    $opts ||= {};
    $opts->{cv_name} = 'synonym_type'
        unless defined $opts->{cv_name};
    $opts->{db_name} = 'null'
        unless defined $opts->{db_name};
    $opts->{dbxref_accession_prefix} = 'autocreated:'
        unless defined $opts->{dbxref_accession_prefix};
    my $data;
    $data->{synonym} = $synonym;

    if (defined $opts->{synonym_type} ) {
      my $synonym_type= $opts->{synonym_type} ;
      my $synonym_db; #< set as needed below
      my $synonym_cv = do {
          my $cvrs = $schema->resultset('Cv::Cv');
          my $find_or_create = $opts->{autocreate} ? 'find_or_create' : 'find';
          $cvrs->$find_or_create({ name => $opts->{cv_name}},
                           { key => 'cv_c1' })
            or croak "cv '$opts->{cv_name}' not found and autocreate option not passed, cannot continue";
      };

      # find/create cvterm and dbxref for the synonym,

      my $existing_cvterm =
            $synonym_cv->find_related('cvterms',
                              { name => $synonym_type,
                              is_obsolete => 0,
                              },
                              { key => 'cvterm_c1' },
          );

        # if there is no existing cvterm for this synonym type, and we
        # have the autocreate flag set true, then create a cvterm,
        # dbxref, and db for it if necessary
        unless( $existing_cvterm ) {
            $opts->{autocreate}
          or croak "cvterm not found for cvterm synonym type  '$synonym_type', and autocreate option not passed, cannot continue";

            # look up the db object if we don't already have it, now
            # that we know we need it
            $synonym_db ||=
                $self->result_source->schema
            ->resultset('General::Db')
            ->find_or_create( { name => $opts->{db_name} },
                          { key => 'db_c1' }
            );

            # find or create the dbxref for this cvterm we are about
            # to create
            my $dbx_acc = $synonym_type;
            my $dbxref =
                $synonym_db->find_or_create_related('dbxrefs',{ accession => $dbx_acc })
            || $synonym_db->create_related('dbxrefs',{ accession => $dbx_acc,
                                             version => 1,
                                     });

            # look up any definition we might have been given for this
            # propname, so we can insert it if given
            my $def = $opts->{definition};


          my $synonym_type_cvterm= $synonym_cv->create_related('cvterms',
                                                 { name => $synonym_type,
                                                   is_obsolete => 0,
                                                   dbxref_id => $dbxref->dbxref_id,
                                                   $def ? (definition => $def) : (),
                                                 }
            );
          $data->{type_id} = $synonym_type_cvterm->cvterm_id();
        } else {
          $data->{type_id} = $existing_cvterm->cvterm_id();
      }
    }

    my ($cvtermsynonym)= $self->search_related('cvtermsynonyms', {
      type_id => $data->{type_id} })->
          search({ 'lower(synonym)'   => {like => lc($synonym) } } );

#search({ 'lower(synonym)' => { like => 'blah'}})
#my $rs = $c->model("DB::Dbentry")->$search({
#'lower('.$key.')' => $q },

#search({ \'lower(synonym)' => { like => 'blah'}})
    $cvtermsynonym= $self->create_related('cvtermsynonyms' , $data) unless defined $cvtermsynonym;

    return $cvtermsynonym;
}



sub delete_synonym {
    my $self=shift;
    my $synonym=shift;

    my $schema = $self->result_source->schema;

    $self->result_source
         ->schema
         ->resultset("Cv::Cvtermsynonym")
         ->search( { cvterm_id => $self->get_column('cvterm_id'),
            synonym   => { 'like' , lc($synonym) }
        })
        ->delete();
}




sub get_secondary_dbxrefs {
    my $self=shift;
    my $schema = $self->result_source->schema;
    my @list;
    my @s =  $self->search_related('cvterm_dbxrefs' , { is_for_definition => 0} );
    foreach (@s) {
      my $accession = $_->dbxref->accession;
      my $db_name = $_->dbxref->db->name;
      push @list, $db_name . ":" .  $accession;
    }
    return @list;
}



sub add_secondary_dbxref {
    my ($self, $accession, $def)=@_;
    $def = 0 if !$def;

    my $schema = $self->result_source->schema;
    my ($db_name, $acc) = split (/:/, $accession);
    if (!$db_name || !$acc) { croak "Accession must be of the form <DB>:<ACCESSION>.  You passed '$accession'" ; }
    my $db = $schema->resultset("General::Db")->find_or_create(
      { name => $db_name },
      { key => 'db_c1' }
      );
    my $dbxref =
         $db->search_related('dbxrefs', { accession => $acc })->first
      || $db->create_related('dbxrefs', { accession => $acc });

    my $cvterm_dbxref = $schema->resultset("Cv::CvtermDbxref")->search(
      { dbxref_id => $dbxref->get_column('dbxref_id'),
        cvterm_id => $self->get_column('cvterm_id') }
      )->first();
    if ($cvterm_dbxref) {
      $cvterm_dbxref->update( { is_for_definition => $def } ) if $def;
    }else {
      $cvterm_dbxref = $schema->resultset("Cv::CvtermDbxref")->create(
          { dbxref_id => $dbxref->get_column('dbxref_id'),
            cvterm_id => $self->get_column('cvterm_id'),
            is_for_definition => $def,
          } );
    }
    return $cvterm_dbxref;
}



sub delete_secondary_dbxref {
    my $self=shift;
    my $accession=shift;
    my $schema = $self->result_source->schema;
    my ($db_name, $acc) = split (/:/, $accession);
    if (!$db_name || !$accession) { croak "Did not pass a legal accession! ($accession)" ; }

    my ($cvterm_dbxref) = $schema->resultset("General::Db")->search(
      { name => $db_name } )->
      search_related('dbxrefs' , { accession => $acc } )->
      search_related('cvterm_dbxrefs', { cvterm_id => $self->get_column('cvterm_id') } );
    if ($cvterm_dbxref) { $cvterm_dbxref->delete() ; }

}



sub create_cvtermprops {
    my ($self, $props, $opts) = @_;

    # process opts
    $opts->{cv_name} = 'cvterm_property'
        unless defined $opts->{cv_name};
    return Bio::Chado::Schema::Util->create_properties
        ( properties => $props,
          options    => $opts,
          row        => $self,
          prop_relation_name => 'cvtermprops',
        );
}



sub root {
    my $self = shift;
    my $root = $self->search_related('cvtermpath_subjects',
                                     {} ,
                                     {
                                       order_by => { -desc => 'pathdistance'},
                                       rows     => 1,
                                     }
                                    )
                    ->single
                    ->find_related('object' , {});

    return $root;
}


sub children {
    shift->search_related('cvterm_relationship_objects');
}


sub direct_children {
    my $self = shift;
    return
        $self->search_related (
            'cvtermpath_subjects',
            {
                pathdistance => { '<' =>  0 },
            } )->search_related('object');
}

#the same using cvtermpath
# return $self->search_related('cvtermpath_objects' , undef , {
#pathdistance => 1 ,  }
#);


sub recursive_children {
    my $self = shift;
    return
        $self->search_related(
            'cvtermpath_objects',
            {
                pathdistance => { '>' =>  0 },
            }
        )->search_related('subject');
}



sub parents {
    shift->search_related('cvterm_relationship_subjects');
}


sub direct_parents {
    my $self = shift;
    return
        $self->search_related(
            'cvtermpath_objects',
            {
                pathdistance => { '<' => 0 } ,
            } )->search_related( 'subject');
}


sub recursive_parents {
    my $self = shift;
    return
        $self->search_related(
            'cvtermpath_subjects',
            {
                pathdistance => { '>' =>  0 } ,
            } )->search_related( 'object');
}

############ CVTERM CUSTOM RESULTSET PACKAGE #############################


__PACKAGE__->resultset_class('Bio::Chado::Schema::Result::Cv::Cvterm::ResultSet');
package Bio::Chado::Schema::Result::Cv::Cvterm::ResultSet;
BEGIN {
  $Bio::Chado::Schema::Result::Cv::Cvterm::ResultSet::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Cv::Cvterm::ResultSet::VERSION = '0.08100';
}
use base qw/ DBIx::Class::ResultSet /;

use Carp;


sub create_with {
    my ($self, $opts) = @_;
    $opts or croak 'must provide a hashref of values to create_with';
    $opts->{name} or croak 'must provide a name for the new cvterm';

    # cv and db default to 'null'
    $opts->{cv} = 'null' unless defined $opts->{cv};
    $opts->{db} = 'null' unless defined $opts->{db};

    # dbxref defaults to autocreated:<cvterm_name>
    $opts->{dbxref} = 'autocreated:'.$opts->{name}
        unless defined $opts->{dbxref};

    # if cv, dbxref, or db are row objects, make sure that they are
    # actually stored in the db, since we need to make foreign key
    # relationships to them
    $_->insert_or_update
      for grep ref, @{$opts}{qw| cv dbxref db |};

    my $schema = $self->result_source->schema;

    # use, find, or create the given cv
    my $cv = ref $opts->{cv} ? $opts->{cv}
                           : $schema->resultset('Cv::Cv')
                              ->find_or_create({ name => $opts->{cv} });

    # return our cvterm if it exists already
    if( my $cvterm = $cv->find_related( 'cvterms',
                              {
                                  name => $opts->{name},
                                  is_obsolete => '0',
                              }) ) {
      return $cvterm;
    }

    # now figure out which dbxref to use (creating the dbxref and db if necessary)
    my $dbx = _find_dbxref( $schema, $opts->{dbxref}, $opts->{db} );

    # and finally make a cvterm to go with the cv and dbxref we found
    return $cv->create_related( 'cvterms',
                        { name => $opts->{name},
                          dbxref_id => $dbx->dbxref_id,
                          }
      );
}
sub _find_dbxref {
    my ( $schema, $dbx, $db ) = @_;

    # if we have a dbxref object to begin with, use it
    return $dbx if ref $dbx;

    ### otherwise, need to find the db
    unless( ref $db ) {
      # convert db name string into object if necessary
      $db = $schema->resultset('General::Db')
                   ->find_or_create({ name => $db });
    }

    #now find or create the dbxref from the db
    return $db->find_or_create_related('dbxrefs',
                               { accession => $dbx },
                              );
}



1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Cv::Cvterm

=head1 DESCRIPTION

A term, class, universal or type within an
ontology or controlled vocabulary.  This table is also used for
relations and properties. cvterms constitute nodes in the graph
defined by the collection of cvterms and cvterm_relationships.

=head1 NAME

Bio::Chado::Schema::Result::Cv::Cvterm

=head1 ACCESSORS

=head2 cvterm_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'cvterm_cvterm_id_seq'

=head2 cv_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

The cv or ontology or namespace to which
this cvterm belongs.

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

A concise human-readable name or
label for the cvterm. Uniquely identifies a cvterm within a cv.

=head2 definition

  data_type: 'text'
  is_nullable: 1

A human-readable text
definition.

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

Primary identifier dbxref - The
unique global OBO identifier for this cvterm.  Note that a cvterm may
have multiple secondary dbxrefs - see also table: cvterm_dbxref.

=head2 is_obsolete

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

Boolean 0=false,1=true; see
GO documentation for details of obsoletion. Note that two terms with
different primary dbxrefs may exist if one is obsolete.

=head2 is_relationshiptype

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

Boolean
0=false,1=true relations or relationship types (also known as Typedefs
in OBO format, or as properties or slots) form a cv/ontology in
themselves. We use this flag to indicate whether this cvterm is an
actual term/class/universal or a relation. Relations may be drawn from
the OBO Relations ontology, but are not exclusively drawn from there.

=head1 RELATIONS

=head2 acquisitionprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Acquisitionprop>

=head2 acquisition_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::AcquisitionRelationship>

=head2 analysisfeatureprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Companalysis::Analysisfeatureprop>

=head2 analysisprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Companalysis::Analysisprop>

=head2 arraydesign_platformtypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Arraydesign>

=head2 arraydesign_substratetypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Arraydesign>

=head2 arraydesignprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Arraydesignprop>

=head2 assayprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Assayprop>

=head2 biomaterialprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Biomaterialprop>

=head2 biomaterial_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::BiomaterialRelationship>

=head2 biomaterial_treatments

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::BiomaterialTreatment>

=head2 cell_line_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::CellLine::CellLineCvterm>

=head2 cell_line_cvtermprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::CellLine::CellLineCvtermprop>

=head2 cell_lineprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::CellLine::CellLineprop>

=head2 cell_line_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::CellLine::CellLineRelationship>

=head2 contacts

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Contact::Contact>

=head2 contact_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Contact::ContactRelationship>

=head2 controls

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Control>

=head2 cvprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Cvprop>

=head2 cv

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cv>

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::General::Dbxref>

=head2 cvterm_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::CvtermDbxref>

=head2 cvtermpath_types

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Cvtermpath>

=head2 cvtermpath_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Cvtermpath>

=head2 cvtermpath_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Cvtermpath>

=head2 cvtermprop_types

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Cvtermprop>

=head2 cvtermprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Cvtermprop>

=head2 cvterm_relationship_types

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::CvtermRelationship>

=head2 cvterm_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::CvtermRelationship>

=head2 cvterm_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::CvtermRelationship>

=head2 cvtermsynonym_types

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Cvtermsynonym>

=head2 cvtermsynonyms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Cvtermsynonym>

=head2 dbxrefprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Dbxrefprop>

=head2 elements

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Element>

=head2 element_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::ElementRelationship>

=head2 elementresult_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::ElementresultRelationship>

=head2 environment_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::EnvironmentCvterm>

=head2 expression_cvterm_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Expression::ExpressionCvterm>

=head2 expression_cvterm_cvterm_types

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Expression::ExpressionCvterm>

=head2 expression_cvtermprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Expression::ExpressionCvtermprop>

=head2 expressionprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Expression::Expressionprop>

=head2 features

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::Feature>

=head2 feature_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeatureCvterm>

=head2 feature_cvtermprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeatureCvtermprop>

=head2 feature_expressionprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Expression::FeatureExpressionprop>

=head2 feature_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::FeatureGenotype>

=head2 featuremaps

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Map::Featuremap>

=head2 featureprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::Featureprop>

=head2 feature_pubprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeaturePubprop>

=head2 feature_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeatureRelationship>

=head2 feature_relationshipprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeatureRelationshipprop>

=head2 libraries

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Library::Library>

=head2 library_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Library::LibraryCvterm>

=head2 libraryprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Library::Libraryprop>

=head2 nd_experiments

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperiment>

=head2 nd_experimentprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentprop>

=head2 nd_experiment_stocks

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentStock>

=head2 nd_experiment_stockprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentStockprop>

=head2 nd_geolocationprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdGeolocationprop>

=head2 nd_protocolprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolprop>

=head2 nd_protocol_reagents

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolReagent>

=head2 nd_reagents

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdReagent>

=head2 nd_reagentprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdReagentprop>

=head2 nd_reagent_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdReagentRelationship>

=head2 organismprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Organism::Organismprop>

=head2 phendescs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::Phendesc>

=head2 phenotype_assays

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phenotype::Phenotype>

=head2 phenotype_attrs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phenotype::Phenotype>

=head2 phenotype_observables

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phenotype::Phenotype>

=head2 phenotype_cvalues

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phenotype::Phenotype>

=head2 phenotype_comparison_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::PhenotypeComparisonCvterm>

=head2 phenotype_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phenotype::PhenotypeCvterm>

=head2 phenstatements

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::Phenstatement>

=head2 phylonodes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phylogeny::Phylonode>

=head2 phylonodeprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phylogeny::Phylonodeprop>

=head2 phylonode_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phylogeny::PhylonodeRelationship>

=head2 phylotrees

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phylogeny::Phylotree>

=head2 projectprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Project::Projectprop>

=head2 project_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Project::ProjectRelationship>

=head2 protocols

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Protocol>

=head2 protocolparam_unittypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Protocolparam>

=head2 protocolparam_datatypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Protocolparam>

=head2 pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Pub::Pub>

=head2 pubprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Pub::Pubprop>

=head2 pub_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Pub::PubRelationship>

=head2 quantificationprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Quantificationprop>

=head2 quantification_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::QuantificationRelationship>

=head2 stocks

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::Stock>

=head2 stockcollections

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::Stockcollection>

=head2 stockcollectionprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::Stockcollectionprop>

=head2 stock_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockCvterm>

=head2 stock_cvtermprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockCvtermprop>

=head2 stock_dbxrefprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockDbxrefprop>

=head2 stockprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::Stockprop>

=head2 stock_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockRelationship>

=head2 stock_relationship_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockRelationshipCvterm>

=head2 studydesignprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Studydesignprop>

=head2 studyfactors

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Studyfactor>

=head2 studyprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Studyprop>

=head2 studyprop_features

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::StudypropFeature>

=head2 synonyms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::Synonym>

=head2 treatments

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Treatment>

=head1 ADDITIONAL RELATIONS

=head2 cvtermprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Cvtermprop>

This C<cvtermprops> relation is a convenient synonym for the
autogenerated L</cvtermprop_cvterms> above, since most often you want
the properties for the cvterm itself.

If you really do want the Cvtermprop rows that have this cvterm as
their B<type>, use C<cvtermprop_types>, listed above.

=head2 cvtermsynonyms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Cv::Cvtermsynonym>

=head1 ADDITIONAL METHODS

=head2 add_synonym

 Usage:        $self->add_synonym($synonym , { type => 'exact' , autocreate => 1} );
 Desc:         adds the synonym $new_synonym to this cvterm
               If the synonym $new_synonym already exists,
               nothing is added.
 Args:         a synonym name  and
    options hashref as:
          {
            synonym_type => [e.g. exact, narrow, broad, related],
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given synonym name.  Default false.

            cv_name => cv.name to use for the given synonym type.
                       Defaults to 'synonym_type',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms
          }
 Ret:          a Cvtermsynonym object

=head2 delete_synonym

 Usage: $self->delete_synonym($synonym)
 Desc:  delete synonym $synonym from cvterm object
  Ret:  nothing
 Args: $synonym
 Side Effects: Will delete all cvtermsynonyms with synonym=$synonym. Case insensitive

=head2 get_secondary_dbxrefs

 Usage: $self->get_secondary_dbxrefs()
 Desc:  find all secondary accessions associated with the cvterm
         These are stored in cvterm_dbxref table as dbxref_ids
 Ret:    a list of accessions (e.g. GO:0000123)
 Args:   none
 Side Effects: none

=head2 add_secondary_dbxref

 Usage: $self->add_secondary_dbxref(accession, 1)
 Desc:  add an alternative id to cvterm. Stores in cvterm_dbxref
 Ret:   a CvtermDbxref object
 Args:  an alternative id (i.e. "GO:0001234"). A second arg will store a is_for_definition=1 (default = 0)
 Side Effects: stores a new dbxref if accession is not found in dbxref table

=head2 delete_secondary_dbxref

 Usage: $self->delete_secondary_dbxref($accession)
 Desc:  delete a cvterm_dbxref from the database
 Ret:   nothing
 Args:  full accession (db_name:dbxref_accession e.g. PO:0001234)
 Side Effects:

=head2 create_cvtermprops

  Usage: $set->create_cvtermprops({ baz => 2, foo => 'bar' });
  Desc : convenience method to create cvterm properties using cvterms
          from the ontology with the given name
  Args : hashref of { propname => value, ...},
         options hashref as:
          {
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given cvtermprop name.  Default false.

            cv_name => cv.name to use for the given cvtermprops.
                       Defaults to 'cvterm_property',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            dbxref_accession_prefix => optional, default
                                       'autocreated:',
            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms

             rank => force numeric rank. Be careful not to pass ranks that already exist
                     for the property type. The function will die in such case.

             allow_duplicate_values => default false.
                If true, allow duplicate instances of the same cvterm
                and value in the properties of the cvterm.  Duplicate
                values will have different ranks.
          }
  Ret  : hashref of { propname => new cvtermprop object }

=head2 root

 Usage: $self->root
 Desc:  find the root cvterm
 Ret:   Cvterm object
 Args:  none

NOTE: This method requires that your C<cvtermpath> table is populated.

=head2 children

 Usage: $self->children
 Desc:  find the direct children of the cvterm

 Ret: L<Bio::Chado::Schema::Result::Cv::CvtermRelationship> resultset of the
      fetched child terms (this can be used in your program to find the
       relationship type id of each child term)
 Args:  none

=head2 direct_children

 Usage: $self->direct_children
 Desc:  find only the direct children of your term
 Ret:   L<Bio::Chado::Schema::Result::Cv::Cvterm>
 Args:  none
 Side Effects: none

NOTE: This method requires that your C<cvtermpath> table is populated.

=head2 recursive_children

 Usage: $self->recursive_children
 Desc:   find all the descendants of the cvterm (children, children of children, and so on)
 Ret: a DBIC resultset of L<Bio::Chado::Schema::Result::Cv::Cvterm>
 Args: none
 Side Effects: none

NOTE: This method requires that your C<cvtermpath> table is populated.

=head2 parents

 Usage: my $self->parents
 Desc:  Find the direct parents of the cvterm
 Ret:  L<Bio::Chado::Schema::Result::Cv::CvtermRelationship> resultset of the parent terms
 Args:  none
 Side Effects: none

=head2 direct_parents

 Usage: $self->direct_parents
 Desc:  get only the direct parents of the cvterm (from the cvtermpath)
 Ret:   L<Bio::Chado::Schema::Result::Cv::Cvterm>
 Args:  none
 Side Effects: none

NOTE: This method requires that your C<cvtermpath> table is populated.

=head2 recursive_parents

 Usage: $self->recursive_parents
 Desc:   find all the ancestors of the cvterm (parents, parents of parents, and so on)
 Ret: L<Bio::Chado::Schema::Result::Cv::Cvterm> resultset
 Args: none
 Side Effects: none

NOTE: This method requires that your C<cvtermpath> table is populated.

=head2 create_with

 Usage: $schema->resultset('Cv::Cvterm')->create_with(
                  { name   => 'cvterm name',
                    cv     => $cv  || 'cv name',
                    db     => $db  || 'db name',
                    dbxref => $dbx || 'accession',
                  });

 Desc: convenience method to create a cvterm, linking it to the CV and
       DB that you name or provide.  For any cv, db, or dbxref that
       you call only by name, does a find_or_create() using that name.
 Ret : a new Cvterm row
 Args: hashref of:
         { name   => 'cvterm name',
           cv     => 'cv name' or L<Bio::Chado::Schema::Result::Cv::Cvterm> row,
           db     => 'db name' or L<Bio::Chado::Schema::Result::General::Db> row,
           dbxref => 'accession' or L<Bio::Chado::Schema::Result::General::Dbxref> row,
         }

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

