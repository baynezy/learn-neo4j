MATCH (tran:Transaction)-[:TRANSACTING_MERCHANT]->(merch:Merchant)
RETURN merch, count(tran);