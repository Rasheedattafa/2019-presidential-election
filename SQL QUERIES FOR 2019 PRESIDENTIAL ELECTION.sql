CREATE TABLE [Cleaned_2019election]
([state] NVARCHAR(255)
      ,[apc] INT
      ,[pdp] INT
      ,[pcp] INT
      ,[adc] INT
      ,[apga] INT
      ,[otherparties] INT
      ,[regvoters] INT
      ,[totvotes] INT
      ,[winner] NVARCHAR(255))
INSERT INTO [Cleaned_2019election]
([state]
      ,[apc]
      ,[pdp]
      ,[pcp]
      ,[adc]
      ,[apga]
      ,[otherparties]
      ,[regvoters]
      ,[totvotes]
      ,[winner] 
	  )

SELECT [state]
      ,[apc]
      ,[pdp]
      ,[pcp]
      ,[adc]
      ,[apga]
      ,[otherparties]
      ,[regvoters]
      ,[totvotes]
      ,[winner]
	  
	  FROM DBO.['2019$']


SELECT * FROM Cleaned_2019election

---GETTING REGISTERED VOTERS VS TOTAL VOTES
SELECT 
  SUM(regvoters) AS REG_VOTERS, 
  SUM(totvotes) AS TOTAL_VOTES, 
  SUM(regvoters)- SUM(totvotes) AS NONVOTERS 
FROM 
  Cleaned_2019election

--GETTING TOTAL VOTES PER PARTY 
SELECT 
  SUM(apc) AS APC_VOTES, 
  SUM(pdp) AS PDP_VOTES, 
  SUM(pcp) AS PCP_VOTES, 
  SUM(adc) AS ADC_VOTES, 
  SUM(apga) AS APGA_COTES, 
  SUM(otherparties) AS OTHER_PARTIES 
FROM 
  Cleaned_2019election

---GETTING TOP 10 STATES THAT VOTED
SELECT 
  TOP 10 * 
FROM 
  Cleaned_2019election 
ORDER BY 
  totvotes DESC

-----GETTING TOP 10 STATES WITH MOST REGISTERED VOTERS
SELECT 
  TOP 10 * 
FROM 
  Cleaned_2019election 
ORDER BY 
  regvoters DESC


---GETTING TOTAL STATES WON BY PDP
SELECT 
  COUNT(state) AS PDP_STATES 
FROM 
  Cleaned_2019election 
WHERE 
  winner = 'PDP'

---GETTING TOTAL STATES WON BY APC
SELECT 
  COUNT(state) AS PDP_STATES 
FROM 
  Cleaned_2019election 
WHERE 
  winner = 'APC'

-----GETTING TOP 10 STATES THAT VOTED APC
SELECT 
  TOP 10 state, 
  apc 
FROM 
  Cleaned_2019election 
ORDER BY 
  apc DESC

-----GETTING TOP 10 STATES THAT VOTED PDP
SELECT 
  TOP 10 state, 
  pdp 
FROM 
  Cleaned_2019election 
ORDER BY 
  pdp DESC

---GETTING VOTE MARGIN
SELECT 
  SUM (apc)- SUM (pdp) AS VOTE_MARGIN 
FROM 
  Cleaned_2019election
