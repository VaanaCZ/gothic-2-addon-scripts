//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Garwig_EXIT   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 999;
	condition   = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Garwig_Wurst(C_INFO)
{
	npc         = Nov_608_Garwig;
	nr			= 3;
	condition	= DIA_Garwig_Wurst_Condition;
	information	= DIA_Garwig_Wurst_Info;
	permanent	= FALSE;
	description = "Willst du eine Wurst?";
};                       

FUNC INT DIA_Garwig_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Garwig_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Garwig_Wurst_15_00"); //Willst du eine Wurst?
	AI_Output (self, other, "DIA_Garwig_Wurst_06_01"); //Ah - lecker, lecker. Hab vielen Dank, Bruder.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Hello   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 3;
	condition   = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Garwig_Hello_Condition()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garwig_Hello_Info()
{
	AI_Output (self ,other,"DIA_Garwig_Hello_06_00"); //Innos sei mit dir - ich hab dich noch nie gesehen, bist du neu hier?
	AI_Output (other ,self,"DIA_Garwig_Hello_15_01"); //Ja, ich bin noch nicht lange dabei.
	AI_Output (self ,other,"DIA_Garwig_Hello_06_02"); //Dann hoffe ich, du wirst dich schnell eingewöhnen. Wenn ich dir irgendwie helfen kann, lass es mich wissen.
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Room   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 5;
	condition   = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent   = FALSE;
	description	= "Was ist das hier für ein Raum? ";
};
FUNC INT DIA_Garwig_Room_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Garwig_Room_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Room_15_00"); //Was ist das hier für ein Raum?
	AI_Output (self ,other,"DIA_Garwig_Room_06_01"); //Hier werden die heilige Reliquien des Klosters aufbewahrt.
	AI_Output (other,self ,"DIA_Garwig_Room_15_02"); //Welche Reliquien?
	AI_Output (self ,other,"DIA_Garwig_Room_06_03"); //Hier ruht Innos' Hammer und das Schild des Feuers. Sie sind die wichtigsten Reliquien der Innoskirche, außerhalb der Reichshauptstadt.
};
//**************************************************************************
//	Info Hammer 
//**************************************************************************
INSTANCE DIA_Garwig_Hammer  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 99;
	condition   = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent   = TRUE;
	description	= "Erzähl mir was über den Hammer";
};
FUNC INT DIA_Garwig_Hammer_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Hammer_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Hammer_15_00"); //Erzähl mir was über den Hammer.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_01"); //Das ist der heilige Hammer von Innos. Mit diesem Hammer erschlug der heilige Rhobar den steinernen Wächter.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_02"); //In den heiligen Schriften heißt es, dass der Steinerne Wächter unverwundbar war, wie ein Turm stand er in der Schlacht und die Waffen seiner Feinde zerbrachen an seiner steinernen Haut.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_03"); //Mit Innos' Namen auf den Lippen stürzte sich Rhobar auf das Ungeheuer und mit einem mächtigen Hieb seines Hammers zerschmetterte er das Wesen.
};
//**************************************************************************
//	Info Schild 
//**************************************************************************
INSTANCE DIA_Garwig_Shield  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 98;
	condition   = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent   = FALSE;
	description	= "Erzähl mir was über den Schild.";
};
FUNC INT DIA_Garwig_Shield_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Shield_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Shield_15_00"); //Erzähl mir was über den Schild.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_01"); //Der Schild des Feuers wurde von Dominique in der Schlacht auf den südlichen Inseln getragen.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_02"); //Doch die Macht des Schildes soll nie wieder benutzt werden, deshalb haben wir ihn an die Wand genagelt.
};
//**************************************************************************
//	Info Auge Innos
//**************************************************************************
INSTANCE DIA_Garwig_Auge  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 4;
	condition   = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent   = FALSE;
	description	= "Wird hier auch das Auge Innos' aufbewahrt?";
};
FUNC INT DIA_Garwig_Auge_Condition()
{
	if Npc_KnowsInfo (other,DIA_Garwig_Room)
	&& (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Auge_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Auge_15_00"); //Wird hier auch das Auge Innos' aufbewahrt?
	AI_Output (self ,other,"DIA_Garwig_Auge_06_01"); //Natürlich nicht. Was für eine seltsame Vorstellung. Niemand weiß, wo sich das göttliche Artefakt befindet.
};
///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_SLEEP		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	23;
	condition	 = 	DIA_Garwig_SLEEP_Condition;
	information	 = 	DIA_Garwig_SLEEP_Info;
	permanent	 = 	TRUE;
	description	 = 	"Was machst du hier?";
};
func int DIA_Garwig_SLEEP_Condition ()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
func void DIA_Garwig_SLEEP_Info ()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_15_00"); //Was machst du hier?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_06_01"); //Ich bin der Wächter der heiligen Artefakte.
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice 		(DIA_Garwig_SLEEP,DIALOG_BACK,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Soll ich dich mal ablösen?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Warum werden die Artefakte bewacht?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Schläfst du nie? ",DIA_Garwig_SLEEP_NEVER);
};
FUNC VOID DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
};
FUNC VOID DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_EXCHANGE_15_00"); //Soll ich dich mal ablösen?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_01"); //Ist das ein Test? Haben die Magier dich geschickt, mich zu prüfen? Ooh - ich wusste es!
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_02"); //Aber ich werde diese Prüfung bestehen. Richte den Magiern aus, dass ich wie ein Fels in der Brandung stehe und allen Verlockungen widerstehe, denn ich bin ein würdiger Wächter.
};
FUNC VOID DIA_Garwig_SLEEP_THIEF()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_THIEF_15_00"); //Warum werden die Artefakte bewacht? Besteht Grund zur Sorge, dass sie gestohlen werden?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_01"); //Was für eine absonderliche Idee. Wie kommst du denn darauf?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_02"); //Nur Dienern Innos' ist es gestattet, das Kloster zu betreten. Und solche Gedanken hegt kein wahrer Gläubiger.
};
FUNC VOID DIA_Garwig_SLEEP_NEVER()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_NEVER_15_00"); //Schläfst du nie?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_01"); //Was für ein seltsamer Gedanke. Natürlich schlafe ich nie. Innos selbst verleiht mir die Kraft, niemals schlafen zu müssen.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_02"); //Denn nur so kann ich die heilige Pflicht der Wache erfüllen.
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice (DIA_Garwig_SLEEP,"Du schläfst wirklich NIE?  ",DIA_Garwig_SLEEP_AGAIN);
};
FUNC VOID DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_AGAIN_15_00"); //Schläfst du wirklich NIE?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_01"); //Nein. Wenn eine Wache einschläft, dann hat sie versagt.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_02"); //Aber ich werde nicht versagen, denn Innos schenkt mir Kraft und Ausdauer, so dass ich niemals müde werde.
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info THIEF Der Hammer ist nicht mehr da
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_THIEF		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_THIEF_Condition;
	information	 = 	DIA_Garwig_THIEF_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Garwig_THIEF_Condition ()
{	
	if  (Npc_IsInState (self, ZS_Talk))
	&&  (Npc_HasItems (hero, Holy_Hammer_MIS) == 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_THIEF_Info ()
{		
					
	if (Hammer_Taken == TRUE) 
	{ 
		AI_Output (self, other, "DIA_Garwig_THIEF_06_00"); //(aufgebracht) Dieb! Du hast nicht nur Schande über mich und dich gebracht, sondern über das ganze Kloster!
		AI_Output (self, other, "DIA_Garwig_THIEF_06_01"); //Du solltest deine Verfehlung büßen! Und vor allem - GIB MIR DEN HAMMER ZURÜCK!!
		
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_THIEF_06_02"); //(verzweifelt) Der Hammer ist verschwunden, wie konnte das geschehen?
		AI_Output (self, other, "DIA_Garwig_THIEF_06_03"); //Ich habe versagt, Innos wird mich strafen!
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Hammer zurückbringen (immer wenn Spieler den Hammer hat)
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_Abgeben		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_Abgeben_Condition;
	information	 = 	DIA_Garwig_Abgeben_Info;
	permanent	 = 	TRUE;
	description	 =  "Ich bringe den Hammer zurück.";
};
func int DIA_Garwig_Abgeben_Condition ()
{	
	if (Npc_HasItems (other, Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Garwig_Abgeben_15_00"); //Ich bringe den Hammer zurück.
	
	if (Hammer_Taken == TRUE)
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_01"); //Du bist ein schändlicher Dieb!
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_02"); //So, du hattest ihn also ...
	};
	AI_Output (self, other, "DIA_Garwig_Abgeben_06_03"); //Aber es ist nicht an mir, über dich zu richten. Innos wird sein Recht über dich sprechen und du wirst seine Strafe empfangen!
	
	B_GiveInvItems (other,self, Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE;
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garwig_PICKPOCKET (C_INFO)
{
	npc			= Nov_608_Garwig;
	nr			= 900;
	condition	= DIA_Garwig_PICKPOCKET_Condition;
	information	= DIA_Garwig_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Garwig_PICKPOCKET_Condition()
{
	C_Beklauen (52, 80);
};
 
FUNC VOID DIA_Garwig_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garwig_PICKPOCKET);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_BACK 		,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};
	
func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};















