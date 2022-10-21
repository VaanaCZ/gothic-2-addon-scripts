// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bones_EXIT(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 999;
	condition	= DIA_Addon_Bones_EXIT_Condition;
	information	= DIA_Addon_Bones_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bones_PICKPOCKET (C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 900;
	condition	= DIA_Addon_Bones_PICKPOCKET_Condition;
	information	= DIA_Addon_Bones_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bones_PICKPOCKET_Condition()
{
	C_Beklauen (75, 104);
};
 
FUNC VOID DIA_Addon_Bones_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
	
func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
func void B_Addon_Bones_KeineZeit()
{
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //Przepraszam, ale nie mam czasu.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //Muszê trenowaæ.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "Kanion czeka.";
};                       
FUNC INT DIA_Addon_Bones_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bones_Anheuern_Info()
{	
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //Kanion czeka...
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Bones_Hello(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Hello_Condition;
	information	= DIA_Addon_Bones_Hello_Info;
	permanent	= FALSE;
	description = "Co s³ychaæ?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //Co s³ychaæ?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //Nie narzekam. Co prawda trochê siê nudzê, ale przynajmniej nie muszê pracowaæ.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //Czekam na nowe zadanie od Grega.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //Jakie zadanie?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //Nie wolno mi o tym mówiæ.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //Bez urazy, ale ciê¿ko pracowa³em, by je dostaæ, i nie mam zamiaru go straciæ.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  			Kannst du mir was beibringen? 
// ************************************************************
INSTANCE DIA_Addon_Bones_Train(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Train_Condition;
	information	= DIA_Addon_Bones_Train_Info;
	permanent	= FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       
FUNC INT DIA_Addon_Bones_Train_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  			Wo finde ich Lehrer
// ************************************************************
INSTANCE DIA_Addon_Bones_Teacher(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Teacher_Condition;
	information	= DIA_Addon_Bones_Teacher_Info;
	permanent	= FALSE;
	description = "Kto mo¿e mnie czegoœ nauczyæ?";
};                       
FUNC INT DIA_Addon_Bones_Teacher_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Bones_Teacher_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //Kto mo¿e mnie czegoœ nauczyæ?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry i Morgan dowodz¹ grupami aborda¿owymi.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //Mog¹ ciê podszkoliæ w walce wrêcz.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //Ludzie Henry'ego æwicz¹ siê w walce broni¹ dwurêczn¹.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan nad si³ê takiego orê¿a przedk³ada szybkoœæ broni jednorêcznej.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //Kto jeszcze?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //Nie mam pojêcia. Nigdy nie interesowa³em siê innymi rzeczami.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //Wydaje mi siê jednak, ¿e Jack Aligator i Samuel mog¹ ci pokazaæ jak¹œ przydatn¹ sztuczkê.
	Knows_HenrysEntertrupp = TRUE;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);

};

// ************************************************************
// 			  			Was weißt du über Francis?
// ************************************************************
INSTANCE DIA_Addon_Bones_Francis(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 3;
	condition	= DIA_Addon_Bones_Francis_Condition;
	information	= DIA_Addon_Bones_Francis_Info;
	permanent	= FALSE;
	description = "Co mo¿esz mi powiedzieæ o Francisie?";
};                       
FUNC INT DIA_Addon_Bones_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Bones_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //Co mo¿esz mi powiedzieæ o Francisie?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //A co tu mówiæ? Rozejrzyj siê. Jedynymi ludŸmi, którzy cokolwiek robi¹, s¹ ch³opaki Henry'ego.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan ca³ymi dniami wyleguje siê w ³ó¿ku albo chleje.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //Nie przejmuje siê Gregiem. Komu siê to nie podoba, dostaje kopniaka w ty³ek.
};

//*********************************************************
//	BDT Armor
//*********************************************************
instance DIA_Addon_Bones_WantArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_WantArmor_Condition;
	information	= DIA_Addon_Bones_WantArmor_Info;
	permanent	= TRUE;
	description = "Daj mi pancerz bandytów.";
};                       
FUNC INT DIA_Addon_Bones_WantArmor_Condition()
{
	if (Greg_GaveArmorToBones == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Bones_WantArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //Daj mi pancerz bandytów.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //Wygl¹dam na wariata? Za coœ takiego Greg urwa³by mi g³owê!
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //Nawet specjalnie zaznaczy³, ¿ebym nie dawa³ nikomu tego pancerza bez jego wyraŸnego rozkazu.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //Nie mogê ci go daæ. Na pewno nie teraz, gdy Greg ju¿ wróci³.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bones nie da mi zbroi bez zgody Grega."); 
};

//*********************************************************
//	Du sollst mir die Rüstung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_GiveArmor_Condition;
	information	= DIA_Addon_Bones_GiveArmor_Info;
	permanent	= FALSE;
	description = "Greg kaza³ wydaæ mi pancerz.";
};                       
FUNC INT DIA_Addon_Bones_GiveArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_GiveArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //Greg kaza³ wydaæ mi pancerz.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //To rozkaz samego kapitana? A ju¿ myœla³em, ¿e sam bêdê musia³ wykonaæ to zadanie.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //Szpiegowanie bandytów to samobójstwo.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //Wolê ju¿ najciê¿sz¹ robotê u Grega.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //Pancerz.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //A, tak. Oto on.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Uwa¿aj na siebie. I lepiej nie rób g³upich ¿artów pod nosem tych bandziorów.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Rozkaz Grega potrafi czyniæ cuda. Mam zbrojê bandytów!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

