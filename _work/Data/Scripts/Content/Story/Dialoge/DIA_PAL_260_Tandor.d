///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Tandor_EXIT   (C_INFO)
{
	npc         = PAL_260_Tandor;
	nr          = 999;
	condition   = DIA_Tandor_EXIT_Condition;
	information = DIA_Tandor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Tandor_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Tandor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Hallo		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	2;
	condition	 = 	DIA_Tandor_Hallo_Condition;
	information	 = 	DIA_Tandor_Hallo_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tandor_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
			return TRUE;
	};
};
func void DIA_Tandor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Tandor_Hallo_08_00"); //Du bist über den Pass gekommen? Respekt. Wir haben schon viele Männer da draußen verloren.
	AI_Output (self, other, "DIA_Tandor_Hallo_08_01"); //Ich weiß selbst, wie es draußen ist - ich habe eine Zeit lang einen Spähtrupp begleitet.
	AI_Output (self, other, "DIA_Tandor_Hallo_08_02"); //Hast du eine Waffe? Wenn du eine gute Waffe brauchst, bist du bei mir richtig.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor handelt mit Waffen in der Burg.");
};
///////////////////////////////////////////////////////////////////////
//	Info Spähtrupp
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Trupp		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	2;
	condition	 = 	DIA_Tandor_Trupp_Condition;
	information	 = 	DIA_Tandor_Trupp_Info;
	permanent 	 =  FALSE;
	description  =  "Was ist mit dem Trupp passiert?";
};
func int DIA_Tandor_Trupp_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Tandor_Hallo)
	{
			return TRUE;
	};
};
func void DIA_Tandor_Trupp_Info ()
{
	AI_Output (other, self, "DIA_Tandor_Trupp_15_00"); //Was ist mit dem Trupp passiert?
	AI_Output (self, other, "DIA_Tandor_Trupp_08_01"); //Wir haben die Gegend erkundet und wollten bis zur Küste vordringen. In einer Höhle haben wir unser Lager aufgeschlagen.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_02"); //Es war tief in der Nacht, als die Orks kamen. Mit Fackeln und Trommeln stürmten sie den Hang hinauf - und entdeckten uns.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_03"); //Wir versuchten zu fliehen, doch nur ich habe es geschafft ...
	AI_Output (self, other, "DIA_Tandor_Trupp_08_04"); //Bald darauf errichteten die Orks die große Palisade und wir zogen uns in die Burg zurück.
};	
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Trade		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	900;
	condition	 = 	DIA_Tandor_Trade_Condition;
	information	 = 	DIA_Tandor_Trade_Info;
	permanent 	 =  TRUE;
	trade		 =	TRUE;
	description	 = 	"Zeig mir deine Ware.";
};
func int DIA_Tandor_Trade_Condition ()
{
		return TRUE;
};
func void DIA_Tandor_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Tandor_Trade_15_00"); //Zeig mir deine Ware.
};		
///////////////////////////////////////////////////////////////////////
//	Info DIA_Tandor_Equipment
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Equipment		(C_INFO)
{
	npc		 	 = 	PAL_260_Tandor;
	nr		 	 =  3;
	condition	 = 	DIA_Tandor_Equipment_Condition;
	information	 = 	DIA_Tandor_Equipment_Info;
	description	 = 	"Garond schickt mich - ich brauche Ausrüstung.";
};

func int DIA_Tandor_Equipment_Condition ()
{
	if  Npc_KnowsInfo (hero, DIA_Garond_Equipment)
	&& (other.guild == GIL_MIL)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Tandor_Equipment_Info ()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_15_00"); //Garond schickt mich - ich brauche Ausrüstung.
	AI_Output (self, other, "DIA_Tandor_Equipment_08_01"); //Nahkampf oder Fernkampf?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Nahkampf",DIA_Tandor_Equipment_Nah);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Fernkampf",DIA_Tandor_Equipment_Fern);
};
FUNC VOID DIA_Tandor_Equipment_Nah()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Nah_15_00"); //Nahkampf.
	AI_Output (self, other, "DIA_Tandor_Equipment_Nah_08_01"); //Einhand- oder Zweihandkämpfer?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Einhand",DIA_Tandor_Equipment_Ein);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Zweihand",DIA_Tandor_Equipment_Zwei);
};
FUNC VOID DIA_Tandor_Equipment_Fern()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Fern_15_00"); //Fernkampf.
	AI_Output (self, other, "DIA_Tandor_Equipment_Fern_08_01"); //Bogen oder Armbrust?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Bogen",DIA_Tandor_Equipment_Bow);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Armbrust",DIA_Tandor_Equipment_Crossbow);
};	
FUNC VOID DIA_Tandor_Equipment_Ein()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Ein_15_00"); //Einhand.
	AI_Output (self, other, "DIA_Tandor_Equipment_Ein_08_01"); //Dann nimm diesen Steinbrecher. Eine gute Waffe.
	B_GiveInvItems (self,other, ItMw_Steinbrecher,1);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Zwei()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Zwei_15_00"); //Zweihand.
	AI_Output (self, other, "DIA_Tandor_Equipment_Zwei_08_01"); //Mit diesem Zweihänder bist du gut ausgerüstet.
	B_GiveInvItems (self,other,ItMw_Zweihaender1 ,1);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Bow()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Bow_15_00"); //Bogen.
	AI_Output (self, other, "DIA_Tandor_Equipment_Bow_08_01"); //Dieser Jagdbogen ist genau das Richtige für dich. Und Pfeile gebe ich dir auch noch mit.
	B_GiveInvItems (self,other,ItRw_Bow_L_03 ,1);
	B_GiveInvItems (self,other, ItRw_Arrow,50);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Crossbow()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Crossbow_15_00"); //Armbrust.
	AI_Output (self, other, "DIA_Tandor_Equipment_Crossbow_08_01"); //Dann nimm diese leichte Armbrust. Bolzen kriegst du auch noch von mir.
	B_GiveInvItems (self,other, ItRw_Crossbow_L_02,1);
	B_GiveInvItems (self,other, ItRw_Bolt,50);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Tandor_KAP3_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP3_EXIT_Condition;
	information	= DIA_Tandor_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Tandor_KAP4_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP4_EXIT_Condition;
	information	= DIA_Tandor_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_News		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	40;
	condition	 = 	DIA_Tandor_News_Condition;
	information	 = 	DIA_Tandor_News_Info;
	permanent	 = 	TRUE;
	description	 = 	"Hast du Neuigkeiten?";
};

func int DIA_Tandor_News_Condition ()
{
	if (Kapitel	== 4)
	&& (Npc_KnowsInfo (hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_News_Info ()
{
	AI_Output (other, self, "DIA_Tandor_News_15_00"); //Hast du Neuigkeiten?

	if (hero.guild == GIL_DJG)
		{
			AI_Output (self, other, "DIA_Tandor_News_08_01"); //Dass ihr Drachenjäger hierher gekommen seid, ist das einzige, was in letzter Zeit passiert ist.
		}
	else
		{
			AI_Output (self, other, "DIA_Tandor_News_08_02"); //Die Drachenjäger sind angekommen.
			AI_Output (self, other, "DIA_Tandor_News_08_03"); //Sie wirken auf mich wie zähe Hunde - und ich hoffe, dass sind sie, denn sonst werden sie nicht lange überleben.
		};
};
//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Tandor_KAP5_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP5_EXIT_Condition;
	information	= DIA_Tandor_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasistlos
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_WASISTLOS		(C_INFO)
{
	npc		 = 	PAL_260_Tandor;
	nr		 = 	51;
	condition	 = 	DIA_Tandor_WASISTLOS_Condition;
	information	 = 	DIA_Tandor_WASISTLOS_Info;
	permanent	 = 	TRUE;

	description	 = 	"Du ziehst nicht gerade ein glückliches Gesicht.";
};

func int DIA_Tandor_WASISTLOS_Condition ()
{
	if (Kapitel == 5)	
		&& (Npc_KnowsInfo (hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_WASISTLOS_Info ()
{
	AI_Output			(other, self, "DIA_Tandor_WASISTLOS_15_00"); //Du ziehst nicht gerade ein glückliches Gesicht.

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Tandor_WASISTLOS_08_01"); //Die Orks werden immer wieder kommen. Solange, bis wir alle tot sind.
	}
	else
	{
	AI_Output			(self, other, "DIA_Tandor_WASISTLOS_08_02"); //Keine gescheite Nahrung schon seit Wochen. Ich verhungere.
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Tandor_KAP6_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP6_EXIT_Condition;
	information	= DIA_Tandor_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Tandor_PICKPOCKET (C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 900;
	condition	= DIA_Tandor_PICKPOCKET_Condition;
	information	= DIA_Tandor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Tandor_PICKPOCKET_Condition()
{
	C_Beklauen (47, 90);
};
 
FUNC VOID DIA_Tandor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Tandor_PICKPOCKET);
	Info_AddChoice		(DIA_Tandor_PICKPOCKET, DIALOG_BACK 		,DIA_Tandor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Tandor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Tandor_PICKPOCKET_DoIt);
};

func void DIA_Tandor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Tandor_PICKPOCKET);
};
	
func void DIA_Tandor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Tandor_PICKPOCKET);
};







































