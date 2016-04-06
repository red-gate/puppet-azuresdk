# Provide default values for parameters.
class azuresdk::params {
  $tempfolder = 'c:/temp'

  $download_base_urls = {
    '2.6' => 'https://download.microsoft.com/download/7/4/8/74814E48-0AF7-416A-8109-0F201B921A98',
    '2.7' => 'https://download.microsoft.com/download/0/F/E/0FE64840-9806-4D3C-9C11-84B743162618',
    '2.8' => 'https://download.microsoft.com/download/D/E/B/DEB395C9-C875-47F3-96F7-55C9A8FCD869',
  }

}
