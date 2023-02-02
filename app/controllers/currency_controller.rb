class CurrencyController<ApplicationController
    def first_currency
    @raw_data=open("https://api.exchangerate.host/symbols").read
    @parsed_data=JSON.parse(@raw_data)
    @symbols_hash=@parsed_data.fetch("symbols")


      @array_of_symbols=@symbols_hash.keys
      
    render({:template=>"currency_templates/step1.html.erb"})
  end

  def second_currency
    @raw_data=open("https://api.exchangerate.host/symbols").read
    @parsed_data=JSON.parse(@raw_data)
    @symbols_hash=@parsed_data.fetch("symbols")


      @array_of_symbols=@symbols_hash.keys

      #params hash {"from_currency"=>"ARS"}
      @from_symbol= params.fetch("from_currency")
      
    render({:template=>"currency_templates/step2.html.erb"})
  end

  def third_currency
    @raw_data=open("https://api.exchangerate.host/symbols").read
    @parsed_data=JSON.parse(@raw_data)
    @symbols_hash=@parsed_data.fetch("symbols")


      @array_of_symbols=@symbols_hash.keys

      

    #opening exchange rate data
    @er_data=open("https://api.exchangerate.host/convert").read
    @parsed_er_data=JSON.parse(@er_data)
    @er= @parsed_er_data.fetch("result")

    #params hash
    @from_symbol= params.fetch("from_currency")
    @to_symbol= params.fetch("to_currency")
      
    render({:template=>"currency_templates/step3.html.erb"})
  end
end
