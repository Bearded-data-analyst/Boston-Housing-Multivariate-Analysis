📑 Mini Report: Boston Housing Dataset Analysis
Introduction
The Boston Housing dataset, compiled by the U.S. Census in 1970, provides 506 observations across 13 features related to socioeconomic status, housing characteristics, and neighborhood conditions. It is widely used to analyze the determinants of housing prices and crime distribution.
Our analysis focuses on two outcomes:
	•	Housing Prices (MEDV – Median Value of Owner-Occupied Homes)
	•	Crime Rate (CRIM – per capita crime rate by town)

Methodology
	•	Conducted exploratory data analysis (EDA) on correlations and interactions between housing, demographic, and neighborhood features.
	•	Focused on how socioeconomic status, crime, education, and urbanization affect housing price and crime rate.
	•	Interaction effects were considered (e.g., urban access × socioeconomic stress).

Findings
🏠 House Prices
	1	Socioeconomic Status (LSTAT):
	◦	Negative correlation with housing price.
	◦	Higher proportion of lower-status population depresses property values.
	2	Number of Rooms (RM):
	◦	More rooms generally increase housing prices.
	◦	However, in socioeconomically depressed areas, large houses lose appeal and even become liabilities.
	3	Education Quality (PTRATIO):
	◦	Lower pupil–teacher ratios are associated with higher home values.
	◦	Suggests elite schooling clusters elevate neighborhood desirability.
	4	Crime & Status Interaction (CRIM × LSTAT):
	◦	Individually, crime and lower-status population reduce housing price.
	◦	When combined, their joint effect is less than additive — once a neighborhood is already socioeconomically stressed, additional crime does not reduce values as sharply.

🔒 Crime Rate
	1	Urbanization (RAD & DIS):
	◦	More radial roads (RAD) → higher crime (urban effect).
	◦	Greater distance from employment centers (DIS) → lower crime.
	2	Interaction (RAD × DIS):
	◦	Suburban areas without road access suffer socio-economic stress, increasing crime risk.
	3	Racial/Economic Composition (B & LSTAT):
	◦	Higher proportion of Black population and higher lower-status population correlate with higher crime, reflecting socioeconomic disparities.
	4	Zoning & Urban Density (ZN & DIS):
	◦	Low ZN (urban density) → higher crime.
	◦	High ZN & High DIS (rural isolation) → crime risk rises due to economic stress.
	◦	Infrastructure (roads, employment access) plays a key preventive role.

Conclusion
	•	Housing Prices are shaped by socioeconomic signals, schooling quality, and neighborhood safety. Bigger houses only command premium value in prosperous areas.
	•	Crime Rate is primarily influenced by urbanization, accessibility, and socioeconomic stress. Road connectivity and employment access reduce crime, while isolation worsens it.
This analysis highlights the dual dynamics of urban planning:
	•	For housing value: policies should focus on reducing socioeconomic disparities and improving education quality.
	•	For crime reduction: balanced infrastructure and economic integration are essential to prevent both urban crime and rural isolation-driven crime.

