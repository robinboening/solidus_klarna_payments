module PageDrivers
  module Admin
    class PaymentMenu < SitePrism::Section
      if KlarnaGateway.up_to_solidus?("1.3.99")
        element :logs, 'a[icon="archive"]'
      elsif KlarnaGateway.is_spree?
        element :logs, 'a.fa-archive'
      else
        element :logs, :xpath,'//*[@id="content-header"]/ul/li/a'
      end
    end

    class Payment < Base
      set_url '/admin/orders/{number}/payments/{payment_id}'

      if KlarnaGateway.is_spree?
        section :payment_menu, PaymentMenu, '#content-header ul.inline-menu'
      else
        section :payment_menu, PaymentMenu, '#content-header ul.header-actions'
      end
    end
  end
end
