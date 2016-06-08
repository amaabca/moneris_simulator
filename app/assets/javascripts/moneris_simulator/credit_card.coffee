class MonerisSimulator.CreditCard
  constructor: (args = {}) ->
    args = $.extend {}, @defaults(), args
    @validCreditCards = args.validCreditCards
    @creditCardNumberInput = args.creditCardNumberInput
    @setUpMonerisPostback()

  setUpMonerisPostback: () ->
    $(window).on 'message onmessage', (e) =>
      window.parent.postMessage @response(), "*"

  response: () ->
    JSON.stringify { dataKey: @dataKey(), bin: @bin(), responseCode: @responseCode() }

  creditCardNumber: () ->
    @creditCardNumberInput.val().replace /\D/g, ""

  dataKey: () ->
    "ot-6mj5lng5b3bnnieo6ccf95p3eap4mjd"

  bin: () ->
    @creditCardNumber().substring 0, 6

  responseCode: () ->
    if @validCreditCard() then "001" else ["940","941","942"]

  validCreditCard: () ->
    @creditCardNumber() in @validCreditCards

  defaults: () ->
    validCreditCards: ["4502285070000007", "4924190000003750", "4551210032790206", "4924190000000145", "4524000000015080", \
                       "4001272222222222", "5454545454545454", "5191111111111111", "5191222222222224", "5191333333333337", \
                       "5191444444444440", "5191555555555557", "5191666666666660", "5191777777777773", "5191888888888886"]
    creditCardNumberInput: $("#monerisDataInput")

$(document).ready ->
    new MonerisSimulator.CreditCard