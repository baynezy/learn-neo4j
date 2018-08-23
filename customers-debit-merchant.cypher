MATCH (:Merchant{name:"Starbucks"})<-[:TRANSACTING_MERCHANT]-(:Debit)<-[:HAS]-(:Account)<-[:HAS]-(cust:Customer)
RETURN DISTINCT cust;