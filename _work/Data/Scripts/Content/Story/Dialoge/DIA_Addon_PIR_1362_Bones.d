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
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //Muszę trenować.
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
	description = "Co słychać?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //Co słychać?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //Nie narzekam. Co prawda trochę się nudzę, ale przynajmniej nie muszę pracować.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //Czekam na nowe zadanie od Grega.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //Jakie zadanie?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //Nie wolno mi o tym mówić.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //Bez urazy, ale ciężko pracowałem, by je dostać, i nie mam zamiaru go stracić.
	
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
	description = "Możesz mnie czegoś nauczyć?";
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
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //Możesz mnie czegoś nauczyć?
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
	description = "Kto może mnie czegoś nauczyć?";
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
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //Kto może mnie czegoś nauczyć?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry i Morgan dowodzą grupami abordażowymi.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //Mogą cię podszkolić w walce wręcz.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //Ludzie Henry'ego ćwiczą się w walce bronią dwuręczną.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan nad siłę takiego oręża przedkłada szybkość broni jednoręcznej.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //Kto jeszcze?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //Nie mam pojęcia. Nigdy nie interesowałem się innymi rzeczami.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //Wydaje mi się jednak, że Jack Aligator i Samuel mogą ci pokazać jakąś przydatną sztuczkę.
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
	description = "Co możesz mi powiedzieć o Francisie?";
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
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //Co możesz mi powiedzieć o Francisie?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //A co tu mówić? Rozejrzyj się. Jedynymi ludźmi, którzy cokolwiek robią, są chłopaki Henry'ego.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan całymi dniami wyleguje się w łóżku albo chleje.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //Nie przejmuje się Gregiem. Komu się to nie podoba, dostaje kopniaka w tyłek.
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
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //Wyglądam na wariata? Za coś takiego Greg urwałby mi głowę!
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //Nawet specjalnie zaznaczył, żebym nie dawał nikomu tego pancerza bez jego wyraźnego rozkazu.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //Nie mogę ci go dać. Na pewno nie teraz, gdy Greg już wrócił.
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
	description = "Greg kazał wydać mi pancerz.";
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
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //Greg kazał wydać mi pancerz.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //To rozkaz samego kapitana? A już myślałem, że sam będę musiał wykonać to zadanie.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //Szpiegowanie bandytów to samobójstwo.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //Wolę już najcięższą robotę u Grega.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //Pancerz.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //A, tak. Oto on.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Uważaj na siebie. I lepiej nie rób głupich żartów pod nosem tych bandziorów.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Rozkaz Grega potrafi czynić cuda. Mam zbroję bandytów!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

