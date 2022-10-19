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
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //Tut mir Leid. Ich hab gerade keine Zeit.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //Ich muss trainieren.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "Der Canyon wartet.";
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
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //Der Canyon wartet.
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
	description = "Wie läuft's?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //Wie läuft's?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //Naja, ich komm klar. Is'n bisschen langweilig, aber wenigstens muss ich nicht arbeiten.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //Ich bereite mich gerade auf meinen nächsten Auftrag vor, den Greg mir gegeben hat.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //Welchen Auftrag?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //Das darf ich nicht sagen.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //Nichts für ungut, Kleiner. Aber ich habe mir das Privileg hart erarbeitet und habe keine Lust, es wieder zu verlieren.
	
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
	description = "Kannst du mir was beibringen?";
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
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //Kannst du mir was beibringen?
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
	description = "Wer kann mir hier was beibringen?";
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
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //Wer kann mir hier was beibringen?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry und Morgan führen unsere Entertrupps an.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //Sie können dir beibringen, wie du besser kämpfst.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //Henrys Leute sind alle mit Zweihandwaffen ausgerüstet.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan mag mehr die schnelleren Einhandwaffen.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //Wer noch?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //Keine Ahnung, für was anderes habe ich mich nie interessiert.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //Aber ich bin mir sicher, dass Alligator Jack oder Samuel dir bestimmt noch den einen oder anderen Trick zeigen können.
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
	description = "Kannst du mir was über Francis erzählen?";
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
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //Kannst du mir was über Francis erzählen?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //Guck dich doch mal um. Die Einzigen, die was tun, sind Henry und seine Jungs.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan liegt den ganzen Tag im Bett, oder lässt sich volllaufen.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //Bei Greg gibt's sowas nicht. Wer nicht spurt, kriegt einen Tritt in den Hintern, so ist das!
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
	description = "Gib mir die Banditenrüstung.";
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
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //Gib mir die Banditenrüstung.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //Ich bin doch nicht verrückt. Greg reißt mir den Kopf ab.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //Er hat ausdrücklich gesagt, dass ohne seinen Befehl niemand die Rüstung bekommt.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //Ich kann sie dir nicht geben. Vor allem nicht jetzt, wo er wieder da ist.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Ohne Erlaubnis von Greg, wird Bones mir die Rüstung nicht geben."); 
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
	description = "Du sollst mir die Banditenrüstung geben. Befehl von Greg.";
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
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //Du sollst mir die Banditenrüstung geben. Befehl von Greg.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //Von Greg? Puh, ich dachte schon, ich müsste doch noch gehen.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //Dieser Späherjob im Banditenlager ist der reinste Selbstmord.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //Lieber hol ich mir den Strafdienst von Greg, als mich von diesen Banditen umbringen zu lassen.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //(genervt) Die Rüstung.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //Ach ja, hier hast du sie.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Sei bloß vorsichtig. Mit den Kerlen ist nicht zu spaßen.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Der Befehl von Greg scheint Wunder zu wirken. Ich habe die BanditenRüstung!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

