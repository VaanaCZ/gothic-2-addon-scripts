///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Engor_EXIT   (C_INFO)
{
	npc         = VLK_4108_Engor;
	nr          = 999;
	condition   = DIA_Engor_EXIT_Condition;
	information = DIA_Engor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Engor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Engor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HALLO		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_HALLO_Condition;
	information	 = 	DIA_Engor_HALLO_Info;
	important	 = 	TRUE;
};
func int DIA_Engor_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Engor_HALLO_Info ()
{
	
 	AI_Output (self, other, "DIA_Engor_HALLO_13_00"); //Ach, wiêc to ty jesteœ tym cz³owiekiem, który przekroczy³ prze³êcz.
	AI_Output (other, self, "DIA_Engor_HALLO_15_01"); //Tak.
	AI_Output (self, other, "DIA_Engor_HALLO_13_02"); //Wspaniale - jestem Engor. Zajmujê siê t¹ ekspedycj¹.
	AI_Output (self, other, "DIA_Engor_HALLO_13_03"); //Tylko sobie nie myœl, ¿e mo¿esz dostaæ cokolwiek za darmo!
	AI_Output (self, other, "DIA_Engor_HALLO_13_04"); //Z drugiej strony, jeœli masz w kieszeniach trochê z³ota, zawsze jestem gotów ubiæ jakiœ interes.
	
	Log_CreateTopic (TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, "Engor zarz¹dza zapasami na zamku. Od czasu do czasu zdarza mu siê robiæ ma³e interesy na boku.");  
};
///////////////////////////////////////////////////////////////////////
//	Info Handeln
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HANDELN		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	10;
	condition	 = 	DIA_Engor_HANDELN_Condition;
	information	 = 	DIA_Engor_HANDELN_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Poka¿ mi swoje towary.";
};

func int DIA_Engor_HANDELN_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Engor_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Engor_HANDELN_Info ()
{
	B_GiveTradeInv (self);

	//Joly: Mc ArrowBolt
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
	//////////////////////////////////////////////////////////////////////////////////////

	AI_Output			(other, self, "DIA_Engor_HANDELN_15_00"); //Poka¿ mi swoje towary.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTPARLAF
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_ABOUTPARLAF		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_ABOUTPARLAF_Condition;
	information	 = 	DIA_Engor_ABOUTPARLAF_Info;
	description	 = 	"Podobno to ty jesteœ odpowiedzialny za rozdzielanie racji.";
};

func int DIA_Engor_ABOUTPARLAF_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Parlaf_ENGOR)
	{
		return TRUE;
	};
};
func void DIA_Engor_ABOUTPARLAF_Info ()
{
	AI_Output (other, self, "DIA_Engor_ABOUTPARLAF_15_00"); //Podobno to ty jesteœ odpowiedzialny za rozdzielanie racji.
	AI_Output (self, other, "DIA_Engor_ABOUTPARLAF_13_01"); //Zgadza siê. A co? Mo¿e mam ciê jeszcze nakarmiæ?
	AI_Output (self, other, "DIA_Engor_ABOUTPARLAF_13_02"); //Jeœli czegoœ chcesz, musisz za to zap³aciæ - jak ca³a reszta.
};
///////////////////////////////////////////////////////////////////////
//	Info Ruestung
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Ruestung		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_Ruestung_Condition;
	information	 = 	DIA_Engor_Ruestung_Info;
	permanent 	 =  FALSE;
	description	 = 	"Masz dla mnie coœ ciekawego?";
};

func int DIA_Engor_Ruestung_Condition ()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Engor_Ruestung_Info ()
{
	AI_Output (other, self, "DIA_Engor_Ruestung_15_00"); //Masz dla mnie coœ ciekawego?
	AI_Output (self, other, "DIA_Engor_Ruestung_13_01"); //Mogê ci za³atwiæ ciê¿k¹ zbrojê.
	AI_Output (self, other, "DIA_Engor_Ruestung_13_02"); //Oczywiœcie nie jest to tani towar. PrzyjdŸ do mnie, kiedy ju¿ zdobêdziesz z³oto, a dobijemy interesu.
};
///////////////////////////////////////////////////////////////////////
//	Info RSkaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_RSkaufen		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_RSkaufen_Condition;
	information	 = 	DIA_Engor_RSkaufen_Info;
	permanent 	 =  TRUE;
	description	 = 	"Kup ciê¿ki pancerz stra¿y. Ochrona (broñ i strza³y) 70, 2500 sztuk z³ota."; 
};
//--------------------------------------
var int DIA_Engor_RSkaufen_perm;
//--------------------------------------
func int DIA_Engor_RSkaufen_Condition ()
{
	if (other.guild == GIL_MIL)
	&& Npc_KnowsInfo (other, DIA_Engor_Ruestung)
	&& (DIA_Engor_RSkaufen_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Engor_RSkaufen_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold,2500))
	{
		AI_Output (other, self, "DIA_Engor_RSkaufen_15_00"); //Daj mi zbrojê.
		AI_Output (self, other, "DIA_Engor_RSkaufen_13_01"); //Proszê. Zapewnia doskona³¹ ochronê.
		B_GiveInvItems (self,other, ITAR_MIL_M,1);
		DIA_Engor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Engor_RSkaufen_13_02"); //Najpierw zdob¹dŸ z³oto.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HELP
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HELP		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	3;
	condition	 = 	DIA_Engor_HELP_Condition;
	information	 = 	DIA_Engor_HELP_Info;
	description	 = 	"Byæ mo¿e bêdê móg³ pomóc.";
};

func int DIA_Engor_HELP_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Engor_ABOUTPARLAF)
	{
		return TRUE;
	};
};
func void DIA_Engor_HELP_Info ()
{
	AI_Output (other, self, "DIA_Engor_HELP_15_00"); //Byæ mo¿e bêdê móg³ pomóc.
	AI_Output (self, other, "DIA_Engor_HELP_13_01"); //Hmmm... Pewnie, czemu nie? Przyda mi siê pomoc.
	AI_Output (other, self, "DIA_Engor_HELP_15_02"); //Co jest do zrobienia?
	AI_Output (self, other, "DIA_Engor_HELP_13_03"); //Nasze zapasy ¿ywnoœci s¹ niewielkie. Szczególnie potrzeba nam miêsa.
	AI_Output (self, other, "DIA_Engor_HELP_13_04"); //Zatem jeœli móg³byœ dostarczyæ nam trochê miêsa, surowego lub gotowanego, szynki lub kie³basy, bylibyœmy ci bardzo wdziêczni. Co ty na to, pomo¿esz nam?

	
	Info_ClearChoices (DIA_Engor_HELP);
	Info_AddChoice (DIA_Engor_HELP,"Nie mam na to czasu.",DIA_Engor_HELP_NO);
	Info_AddChoice (DIA_Engor_HELP,"Nie martw siê, przyniosê ci miêso.",DIA_Engor_HELP_YES);
	
	
};
FUNC VOID DIA_Engor_HELP_NO()
{
	AI_Output (other, self, "DIA_Engor_HELP_NO_15_00"); //Nie mam na to czasu.
	AI_Output (self, other, "DIA_Engor_HELP_NO_13_01"); //Wiêc czemu marnujesz mój?
	
	MIS_Engor_BringMeat = LOG_OBSOLETE; 
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Engor_HELP_YES()
{
	AI_Output (other, self, "DIA_Engor_HELP_YES_15_00"); //Nie martw siê, przyniosê ci miêso.
	AI_Output (self, other, "DIA_Engor_HELP_YES_13_01"); //Dwa tuziny sztuk miêsa pozwoli³yby mi nape³niæ kilka g³odnych brzuchów. Wróæ, kiedy ju¿ zdobêdziesz miêso. A teraz muszê wracaæ do pracy.

	Log_CreateTopic (TOPIC_BringMeat, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat, LOG_RUNNING);
	B_LogEntry  (TOPIC_BringMeat,"Engor potrzebuje dwóch tuzinów kawa³ków miêsa, aby wy¿ywiæ swoich ludzi.");
	B_LogEntry  (TOPIC_BringMeat,"Niewa¿ne, czy bêdzie to kie³basa, szynka, czy sma¿one albo surowe miêso. Chodzi tylko o to, ¿eby jego ch³opcy mogli coœ wrzuciæ na z¹b.");  

	
	MIS_Engor_BringMeat = LOG_RUNNING;  
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info BRINGMEAT
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_BRINGMEAT		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	4;
	condition	 = 	DIA_Engor_BRINGMEAT_Condition;
	information	 = 	DIA_Engor_BRINGMEAT_Info;
	permanent	 = 	TRUE;
	description	 = 	"Proszê, przynios³em ci coœ (oddaj miêso).";
};

func int DIA_Engor_BRINGMEAT_Condition ()
{	
	if (MIS_Engor_BringMeat == LOG_RUNNING)
	&& (Meat_Counter < Meat_Amount)
	&&((Npc_HasItems (hero, ItFo_Bacon) 	>= 1)
	|| (Npc_HasItems (hero, ItFoMuttonRaw)  >= 1)
	|| (Npc_HasItems (hero, ItFoMutton) 	>= 1)
	|| (Npc_HasItems (hero, ItFo_Sausage) 	>= 1))
	{
		return TRUE;
	};
};
func void DIA_Engor_BRINGMEAT_Info ()
{
	var string ConcatRaw;
	var string ConcatMutton;
	var string ConcatBacon;
	var string ConcatSausage;
	
	AI_Output (other, self, "DIA_Engor_BRINGMEAT_15_00"); //Proszê, przynios³em ci coœ.
	
// ***** Rohes Fleisch *****
	if (Npc_HasItems (hero,ItFoMuttonRaw) >= 1) 
	{
		if (Npc_HasItems (hero, ItFoMuttonRaw) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			B_GiveInvItems (hero, self, ItFoMuttonRaw, (Meat_Amount - Meat_Counter));
		
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFoMuttonRaw) < Meat_Amount) // muss hier stehen, wegen nächster Zeile
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFoMuttonRaw));
			
			//B_GiveInvItems (hero, self,ItFoMuttonRaw, (Npc_HasItems (hero,ItFoMuttonRaw))); 
		
			ConcatRaw = IntToString (Npc_HasItems (other,ItFoMuttonRaw));
			ConcatRaw = ConcatStrings (ConcatRaw, "Odda³eœ surowe miêso");
			 
			AI_PrintScreen (ConcatRaw, -1, 35, FONT_ScreenSmall, 2);
			Npc_RemoveInvItems (other, ItFoMuttonRaw,(Npc_HasItems (other,ItFoMuttonRaw)));
		};
	};
// ***** gebratenes Fleisch *****
	if (Npc_HasItems (hero,ItFoMutton) >= 1) 
	{
		if (Npc_HasItems (hero, ItFoMutton) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			B_GiveInvItems (hero, self, ItFoMutton, (Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFoMutton) < Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFoMutton));
			
			//B_GiveInvItems (hero, self,ItFoMutton, (Npc_HasItems (hero,ItFoMutton)));
			
			ConcatMutton = IntToString (Npc_HasItems (other,ItFoMutton));
			ConcatMutton = ConcatStrings (ConcatMutton, "Odda³eœ sma¿one miêso");
			 
			AI_PrintScreen (ConcatMutton, -1, 38, FONT_ScreenSmall, 2);
			Npc_RemoveInvItems (other, ItFoMutton,(Npc_HasItems (other,ItFoMutton)));
		};
	};
// ***** Schinken *****	
	if (Npc_HasItems (hero,ItFo_Bacon) >= 1) 
	{
		if (Npc_HasItems (hero, ItFo_Bacon) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			B_GiveInvItems (hero, self, ItFo_Bacon, (Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFo_Bacon) < Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFo_Bacon));
			
			//B_GiveInvItems (hero, self,ItFo_Bacon, (Npc_HasItems (hero,ItFo_Bacon)));
			
			ConcatBacon =  IntToString (Npc_HasItems (other,ItFo_Bacon));
			ConcatBacon = ConcatStrings (ConcatBacon, "Odda³eœ szynkê");
			
			AI_PrintScreen (ConcatBacon, -1, 41, FONT_ScreenSmall, 3);
			
			Npc_RemoveInvItems (other, ItFo_Bacon,(Npc_HasItems (other,ItFo_Bacon)));
		};
	};
	// ***** Würste *****	
	if (Npc_HasItems (hero,ItFo_Sausage) >= 1) 
	{
		if (Npc_HasItems (hero, ItFo_Sausage) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			
			B_GiveInvItems (hero, self, ItFo_Sausage, (Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFo_Sausage) < Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFo_Sausage));
		
			//B_GiveInvItems (hero, self,ItFo_Sausage, (Npc_HasItems (hero,ItFo_Sausage)));
			
			ConcatSausage =  IntToString (Npc_HasItems (other,ItFo_Sausage));
			ConcatSausage = ConcatStrings (ConcatSausage, "Odda³eœ kie³basê");
			
			AI_PrintScreen (ConcatSausage, -1, 44, FONT_ScreenSmall, 3);
			Npc_RemoveInvItems (other, ItFo_Sausage,(Npc_HasItems (other,ItFo_Sausage)));	
		};
	};
	// ***** Dialoge und XP *****	
	if (Meat_Amount > Meat_Counter)
	{	
		var string GesamtFleisch;
		
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_01"); //NieŸle jak na pocz¹tek, ale potrzeba mi wiêcej.
		
		GesamtFleisch = IntToString (Meat_Counter);
		GesamtFleisch = ConcatStrings ("Oddane miêso:",GesamtFleisch);
		
		AI_PrintScreen (GesamtFleisch, -1, 48, FONT_ScreenSmall, 3);
	};
	if (Meat_counter >= Meat_Amount)
	{
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_02"); //Przynios³eœ wystarczaj¹co du¿o miêsa. To powinno wystarczyæ na jakiœ czas.
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_03"); //Ale nie myœl sobie, ¿e cokolwiek dostaniesz za darmo!
		/*
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_04"); //Hm...
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_05"); //Na schön. Du hast mir geholfen, du kriegst was umsonst. Ich gebe dir eine Information. 	
		*/
		MIS_Engor_BringMeat = LOG_SUCCESS;
		B_GivePlayerXP (XP_BringMeat);
		Log_AddEntry (TOPIC_BringMeat,"Engor dosta³ miêso. Ma je rozdzieliæ pomiêdzy swoich ludzi."); 
	};
};

//*************************************
//*************************************
//***								***
//***			Kapitel 4			***
//***								***
//*************************************
//*************************************

///////////////////////////////////////////////////////////////////////
//	Wie laufen die Geschäfte?
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Business		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	1;
	condition	 = 	DIA_Engor_Business_Condition;
	information	 = 	DIA_Engor_Business_Info;
	permanent	 =	FALSE;	
	description	 = 	"Jak idzie interes?";
	
};

func int DIA_Engor_Business_Condition ()
{
	if (Kapitel >= 4)
	&& (MIS_Engor_BringMeat == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Engor_Business_Info ()
{
	AI_Output (other, self, "DIA_Engor_Business_15_00"); //Jak interesy?
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			AI_Output (self, other, "DIA_Engor_Business_13_01"); //No, no. Mam nadziejê ¿e ³owcy smoków s¹ równie bogaci, co wygadani.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Engor_Business_13_02"); //Do niczego! Paladyni nic nie kupuj¹.
		};

	AI_Output (self, other, "DIA_Engor_Business_13_03"); //Co z tob¹, potrzebujesz jeszcze czegoœ?
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Engor_PICKPOCKET (C_INFO)
{
	npc			= VLK_4108_Engor;
	nr			= 900;
	condition	= DIA_Engor_PICKPOCKET_Condition;
	information	= DIA_Engor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie¿ tej mapy bêdzie ryzykowna)";
};                       

FUNC INT DIA_Engor_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_Map_Oldworld) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Engor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Engor_PICKPOCKET);
	Info_AddChoice		(DIA_Engor_PICKPOCKET, DIALOG_BACK 		,DIA_Engor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Engor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Engor_PICKPOCKET_DoIt);
};

func void DIA_Engor_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self, other, ItWr_Map_Oldworld, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Engor_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Engor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Engor_PICKPOCKET);
};
