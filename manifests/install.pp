# Install a given version of the Azure SDK
#
# inspiration from:
# https://www.microsoft.com/en-us/download/details.aspx?id=46892
# http://stackoverflow.com/questions/33334848/which-files-to-select-for-installing-an-old-versions-of-the-azure-sdk-for-net
define azuresdk::install($version, $tempfolder) {
  include ::azuresdk::params
  require archive

  $folder = "${tempfolder}/azuresdk${version}"
  ensure_resource('file', [$tempfolder, $folder], { ensure => directory })

  $baseurl = $::azuresdk::params::download_base_urls[$version]
  $authoring_tools_version = $::azuresdk::params::authoring_tools_display_versions[$version]
  $dotnetlibraries_installer_guid = $::azuresdk::params::dotnetlibraries_installer_guids[$version]

  #
  # Microsoft Azure Authoring Tools
  #
  archive { "${folder}/MicrosoftAzureAuthoringTools-${::architecture}.msi":
    source  => "${baseurl}/MicrosoftAzureAuthoringTools-${::architecture}.msi",
    require => File[$folder],
  }
  ->
  package { "Microsoft Azure Authoring Tools - ${authoring_tools_version}":
    source => "${folder}/MicrosoftAzureAuthoringTools-${::architecture}.msi",
  }
  ->

  #
  # Microsoft Azure Libraries for .NET
  #
  archive { "${folder}/MicrosoftAzureLibsForNet-${::architecture}.msi":
    source  => "${baseurl}/MicrosoftAzureLibsForNet-${::architecture}.msi",
    require => File[$folder],
  }
  ->
  package { "Microsoft Azure Libraries for .NET - ${version}":
    source => "${folder}/MicrosoftAzureLibsForNet-${::architecture}.msi",
  }
  ->
  # We need this for the time being to remove the special \u2013 unicode character from the display name
  # of the Azure Libraries installer to keep puppet happy. :/
  registrykey { "Hack 'Microsoft Azure Libraries for .NET - ${version}' display name to remove unicode character":
    key     => "HKLM:SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\${dotnetlibraries_installer_guid}",
    subName => 'DisplayName',
    data    => "Microsoft Azure Libraries for .NET - ${version}",
  }

  #
  # Microsoft Azure Tools for Microsoft Visual Studio 2013
  #
  archive { "${folder}/MicrosoftAzureTools.VS120.exe":
    source => "${baseurl}/MicrosoftAzureTools.VS120.exe",
  }
  ->
  package { "Microsoft Azure Tools for Microsoft Visual Studio 2013 - v${version}":
    source          => "${folder}/MicrosoftAzureTools.VS120.exe",
    install_options => ['/quiet'],
  }
  ->

  #
  # Microsoft Azure Tools for Microsoft Visual Studio 2015
  #
  archive { "${folder}/MicrosoftAzureTools.VS140.exe":
    source => "${baseurl}/MicrosoftAzureTools.VS140.exe",
  }
  ->
  package { "Microsoft Azure Tools for Microsoft Visual Studio 2015 - v${version}":
    source          => "${folder}/MicrosoftAzureTools.VS140.exe",
    install_options => ['/quiet'],
  }

}
