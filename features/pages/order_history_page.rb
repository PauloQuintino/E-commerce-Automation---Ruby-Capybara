class OrderHistoryPage < SitePrism::Page

    element :order_history, 'a[title="Orders"]'

    def access_order_history
        order_history.click
        sleep(2)
    end
end