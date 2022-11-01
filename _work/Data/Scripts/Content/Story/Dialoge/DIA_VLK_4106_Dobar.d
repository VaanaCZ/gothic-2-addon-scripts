///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Dobar_EXIT   (C_INFO)
{
	npc         = VLK_4106_Dobar;
	nr          = 999;
	condition   = DIA_Dobar_EXIT_Condition;
	information = DIA_Dobar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Dobar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dobar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4106_Dobar;
	nr		 	 = 	2;
	condition	 = 	DIA_Dobar_HALLO_Condition;
	information	 = 	DIA_Dobar_HALLO_Info;
	permanent 	 =  FALSE;
	important	 =  TRUE;
};
func int DIA_Dobar_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Dobar_HALLO_Info ()
{
	
	AI_Output (self, other, "DIA_Dobar_HALLO_08_00"); //(nevrle) Co chceš?
};
///////////////////////////////////////////////////////////////////////
//	Info Ich verstehe mich auf's schmieden.
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Talent		(C_INFO)
{
	npc		 	 = 	VLK_4106_Dobar;
	nr		 	 = 	3;
	condition	 = 	DIA_Dobar_Talent_Condition;
	information	 = 	DIA_Dobar_Talent_Info;
	permanent 	 =  FALSE;
	description	 =  "Vím pár věci o kovařině.";
};
func int DIA_Dobar_Talent_Condition ()
{	
	if (Npc_GetTalentSkill (other, NPC_TALENT_SMITH) > 0)  
	{
		return TRUE;
	};
};
func void DIA_Dobar_Talent_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Talent_15_00"); //Vím pár věci o kovařině.
	AI_Output (self, other, "DIA_Dobar_Talent_08_01"); //Fajn, a co má být?
};
///////////////////////////////////////////////////////////////////////
//	Info Schmiede
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Schmiede		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	3;
	condition	 = 	DIA_Dobar_Schmiede_Condition;
	information	 = 	DIA_Dobar_Schmiede_Info;
	permanent 	 =  FALSE;
	description	 = 	"Mohu si u tebe v kovárně něco vyrobit?";
};

func int DIA_Dobar_Schmiede_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Dobar_Talent)
	{	
		return TRUE;
	};
};
func void DIA_Dobar_Schmiede_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Schmiede_15_00"); //Mohu si u tebe v kovárně něco vyrobit?
	AI_Output (self, other, "DIA_Dobar_Schmiede_08_01"); //Teď zrovna nevím, kam dřív skočit, jenom bychom si tu překáželi. Počkej, až se setmí.
	AI_Output (self, other, "DIA_Dobar_Schmiede_08_02"); //Pak půjdeme s Parlafem na kutě a ty budeš mít volné pole působnosti.
};
///////////////////////////////////////////////////////////////////////
//	Info beibringen
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_beibringen		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	2;
	condition	 = 	DIA_Dobar_beibringen_Condition;
	information	 = 	DIA_Dobar_beibringen_Info;
	permanent 	 =  FALSE;
	description	 = 	"Můžeš mě něčemu naučit?";
};

func int DIA_Dobar_beibringen_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Dobar_Talent)
	{	
		return TRUE;
	};
};
func void DIA_Dobar_beibringen_Info ()
{
	AI_Output (other, self, "DIA_Dobar_beibringen_15_00"); //Můžeš mě něčemu naučit?
	AI_Output (self, other, "DIA_Dobar_beibringen_08_01"); //Základy už máš. Můžu ti teda ukázat, jak svou práci ještě vylepšit.
	AI_Output (self, other, "DIA_Dobar_beibringen_08_02"); //Pak budeš moci vyrábět lepší zbraně.
	
	Dobar_Learnsmith = TRUE;
	Log_CreateTopic	(TOPIC_Teacher_OC, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher_OC, "Dobar mě naučí kout lepší zbraně.");
};
///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Teach		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	3;
	condition	 = 	DIA_Dobar_Teach_Condition;
	information	 = 	DIA_Dobar_Teach_Info;
	description	 = 	B_BuildLearnString ("Ukaž mi, jak vykovat dobrý meč!", B_GetLearnCostTalent (other, NPC_TALENT_SMITH, WEAPON_1H_Special_01));
	permanent	 =  TRUE;
};
func int DIA_Dobar_Teach_Condition ()
{	
	if (Dobar_Learnsmith == TRUE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Dobar_Teach_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Teach_15_00"); //Ukaž mi, jak vykovat dobrý meč!
	
	if B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_01) 
	{	
		AI_Output (self, other, "DIA_Dobar_Teach_08_01"); //Pokud má daná zbraň za něco stát, musíš nejdřív pečlivě a stejnoměrně rozžhavit ocel.
		AI_Output (self, other, "DIA_Dobar_Teach_08_02"); //Když to budeš mít na paměti, čepele, které vykováš, budou tvrdší a ostřejší.
		AI_Output (self, other, "DIA_Dobar_Teach_08_03"); //Víc už vědět nepotřebuješ. Jestli chceš tady na hradě někde sehnat ocel, promluv si s Engorem.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Waffe
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Waffe		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	80;
	condition	 = 	DIA_Dobar_Waffe_Condition;
	information	 = 	DIA_Dobar_Waffe_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mohl bys mi vyrobit zbraň?";
};
func int DIA_Dobar_Waffe_Condition ()
{
	return TRUE;
};
func void DIA_Dobar_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Waffe_15_00"); //Mohl bys mi vyrobit zbraň?
	AI_Output (self, other, "DIA_Dobar_Waffe_08_01"); //Na to nemám čas. Zbraně rozděluje Tandor - já je pouze vyrábím a Parlaf je pak brousí.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor na hradě obchoduje se zbraněmi.");
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_NEWS		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	900;
	condition	 = 	DIA_Dobar_NEWS_Condition;
	information	 = 	DIA_Dobar_NEWS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak jde práce?";
};
func int DIA_Dobar_NEWS_Condition ()
{
	return TRUE;
};
func void DIA_Dobar_NEWS_Info ()
{
	
	
	AI_Output (other, self, "DIA_Dobar_NEWS_15_00"); //Jak jde práce?
	
	if (Dobar_einmalig == FALSE)
	{
		AI_Output (self, other, "DIA_Dobar_NEWS_08_01"); //Zrovna kovám zbraně pro rytíře na hradě. Od té doby, co jsme tady, se musím činit, co mi síly stačí.
		AI_Output (self, other, "DIA_Dobar_NEWS_08_02"); //A taky že je to zapotřebí. Ukážeme těm zatraceným skřetům, jak ostré jsou naše břity!

		if ((Npc_IsDead(Parlaf)) == FALSE)
		{
			B_TurnToNpc (self, Parlaf);
			AI_Output (self, other, "DIA_Dobar_NEWS_08_03"); //(volá) Hej, Parlafe - ať jsou tyhle meče pěkné a ostré! Skřeti jsou sakra tuzí protivníci!
			B_TurnToNpc (self, other); 
		};
		Dobar_einmalig = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Dobar_NEWS_08_04"); //Mohlo by to být lepší. Kdybys mě furt nerušil, určitě bych už měl hotovo aspoň něco.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dobar_PICKPOCKET (C_INFO)
{
	npc			= VLK_4106_Dobar;
	nr			= 900;
	condition	= DIA_Dobar_PICKPOCKET_Condition;
	information	= DIA_Dobar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Krádež jeho hrudky rudy by byla dosti riskantní.)";
};                       

FUNC INT DIA_Dobar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItMI_Nugget) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (79 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Dobar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dobar_PICKPOCKET);
	Info_AddChoice		(DIA_Dobar_PICKPOCKET, DIALOG_BACK 		,DIA_Dobar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dobar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dobar_PICKPOCKET_DoIt);
};

func void DIA_Dobar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 79)
	{
		B_GiveInvItems (self, other, ItMI_Nugget, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Dobar_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Dobar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dobar_PICKPOCKET);
};
















