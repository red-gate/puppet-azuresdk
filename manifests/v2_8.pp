# Install Azure SDK 2.8
class azuresdk::v2_8(
  $tempfolder = $azuresdk::params::tempfolder
  ) inherits azuresdk::params {

  azuresdk::install {'Azure SDK 2.8':
    version    => '2.8',
    tempfolder => $tempfolder,
  }
}
