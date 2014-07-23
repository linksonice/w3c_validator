# = Class: w3c_validator
#
# it builds the validator front end, complete with
# all the dependencies!
#
# == Parameters
#
# == Actions
#
# == Requires
#
# == Examples
#
# == Notes
#
# == Author
# rancid.iodine@gmail.com
#
class w3c_validator {

  class { 'w3c_validator::rpm_deps': }
    ->
  class { 'w3c_validator::cpan_deps': }
    ->
  class { 'w3c_validator::misc_deps': }

}
