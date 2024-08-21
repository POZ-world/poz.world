# frozen_string_literal: true

module GoogleTagManagerHelper
  def google_tag_manager(gtm_id)
    return '' if gtm_id.blank?

    javascript_tag nonce: true do
      <<~JS.strip_heredoc#.html_safe
        (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','#{gtm_id}');
      JS
    end
  end
end
