// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_3_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_3_EXIT_Condition;
	information	= DIA_NOV_3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_3_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_3_Fegen_Condition;
	information	= DIA_NOV_3_Fegen_Info;
	permanent	= TRUE;
	description = "Ich brauche Hilfe beim Fegen der Novizenkammern.";
};                       
//------------------------------------
var int Feger1_Permanent; 
var int Feger2_Permanent;
//------------------------------------
FUNC INT DIA_NOV_3_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Fegen_15_00"); //Ich brauche Hilfe beim Fegen der Novizenkammern.
	
	//---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID (Feger1)  == Hlp_GetInstanceID (self))
	{
		if (NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_01"); //Bisher hilft dir niemand, was? Ich helfe dir nur, wenn du mindestens einen weiteren gefunden hast, der mitmacht.
			
			B_LogEntry 	(Topic_ParlanFegen,"Der Novize, der im Keller fegt, hilft mir, wenn ich einen weiteren Novizen gefunden habe, der bereit ist, die Kammern zu fegen.");
		}
		else if  (NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE)
		{	
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_02"); //Bin ich der einzige, der dir hilft?
			AI_Output (other, self, "DIA_NOV_3_Fegen_15_03"); //Nein, ich habe bereits Hilfe bekommen.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_04"); //Dann bin ich dabei.
			NOV_Helfer = (NOV_Helfer +1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Der Novize aus dem Keller hilft mir jetzt, die Kammern zu fegen.");
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_05"); //Hey, Bruder - ich helfe dir schon. Du musst mich nicht mehr überreden.
		};
	};
	//----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------
	
	if (Hlp_GetInstanceID (Feger2) ==  Hlp_GetInstanceID (self))
	{	
		if (Feger2_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_08"); //Klar helfe ich dir. Wir Novizen müssen doch zusammenhalten. Eine Hand wäscht die andere.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_09"); //Ich brauche nur 50 Goldstücke, weil ich noch Parlan bezahlen muss.
			
			B_LogEntry 	(Topic_ParlanFegen,"Der Novize vor der Kirche hilft mir, wenn ich ihm 50 Goldstücke gebe.");
			
			Info_ClearChoices  (DIA_NOV_3_Fegen);
			Info_AddChoice (DIA_NOV_3_Fegen,"Vielleicht später...",DIA_NOV_3_Fegen_Nein);
			
			if (Npc_HasItems (other, ItMi_Gold) >= 50)
			{
				Info_AddChoice (DIA_NOV_3_Fegen,"Okay, ich bezahle.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else //if (Feger2_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_06"); //Ich hab doch schon zugesagt. Du hast mir geholfen und ich helfe dir.
		};
	};	
		//------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------
		
	if (Hlp_GetInstanceID (Feger1) !=  Hlp_GetInstanceID (self)) 
	&& (Hlp_GetInstanceID (Feger2) !=  Hlp_GetInstanceID (self)) 
	{	
		AI_Output (self, other, "DIA_NOV_3_Fegen_03_07"); //Vergiss es - dafür habe ich keine Zeit. Such dir einen anderen, der dir hilft.
	};
};


FUNC VOID DIA_NOV_3_Fegen_Nein()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //Vielleicht später, momentan kann ich mir das nicht leisten.
	Info_ClearChoices  (DIA_NOV_3_Fegen);
};
FUNC VOID DIA_NOV_3_Fegen_Ja()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //Okay, ich bezahle.
	AI_Output (self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //Gut, dann werde ich mal loslegen.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	NOV_Helfer = (NOV_Helfer +1);
	B_GivePlayerXP (XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices  (DIA_NOV_3_Fegen);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FEGEN");
	
	B_LogEntry 	(Topic_ParlanFegen,"Der Novize vor der Kirche hilft mir jetzt, die Kammern zu fegen.");
	
	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_3_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_3_Wurst_Condition;
	information	= DIA_NOV_3_Wurst_Info;
	permanent	= TRUE;
	description = "Willst du 'ne Wurst?";
};                       

FUNC INT DIA_NOV_3_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Wurst_15_00"); //Willst du 'ne Wurst?
	AI_Output (self, other, "DIA_NOV_3_Wurst_03_01"); //Klar, immer her damit. So 'ne Wurst ist nicht zu verachten.
	
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
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_3_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_3_JOIN_Condition;
	information	= DIA_NOV_3_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will ein Magier werden!";
};                       

FUNC INT DIA_NOV_3_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_JOIN_15_00"); //Ich will ein Magier werden!
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_01"); //Das wollen viele der Novizen. Aber nur den wenigsten ist es bestimmt, als Erwählte die Chance zu bekommen, in den Kreis des Feuers aufgenommen zu werden.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_02"); //Ein Magier vom Kreis des Feuers zu sein, ist die höchste Ehre, die dir in unserem Orden zuteil werden kann.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_03"); //Du wirst hart dafür arbeiten müssen, um deine Chance zu bekommen.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_3_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_3_PEOPLE_Condition;
	information	= DIA_NOV_3_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer führt dieses Kloster?";
};                       

FUNC INT DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_PEOPLE_15_00"); //Wer führt dieses Kloster?
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_01"); //Wir Novizen dienen den Magiern vom Kreis des Feuers. Diese wiederum werden angeführt vom hohen Rat, der aus den drei mächtigsten Magiern besteht.
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_02"); //Aber für alle Belange der Novizen ist Parlan zuständig. Er ist immer im Hof und überwacht die Arbeit der Novizen.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_3_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_3_LOCATION_Condition;
	information	= DIA_NOV_3_LOCATION_Info;
	permanent	= TRUE;
	description = "Was kannst du mir über dieses Kloster erzählen?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_LOCATION_15_00"); //Was kannst du mir über dieses Kloster erzählen?
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_01"); //Wir bauen uns hier unsere bescheidene Verpflegung selbst an. Wir züchten Schafe und keltern Wein.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_02"); //Es gibt eine Bibliothek, aber deren Nutzung ist den Magiern und den ausgesuchten Novizen vorbehalten.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_03"); //Wir anderen Novizen kümmern uns in erster Linie darum, dass es den Magiern vom Kreis des Feuers an nichts fehlt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_3_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_3_STANDARD_Condition;
	information	= DIA_NOV_3_STANDARD_Info;
	permanent	= TRUE;
	description = "Was gibt's Neues?";
};                       
func INT DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NOV_3_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel == 1)
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_01"); //Das fragt der Richtige! Alle Gespräche unter den Novizen drehen sich nur um dich.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_02"); //Es kommt nur sehr selten vor, dass ein Neuer wie du in den Kreis des Feuers erwählt wird.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_03"); //Es ist wieder soweit. Einer der Novizen wird bald in den Kreis des Feuers aufgenommen.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_04"); //Die Prüfungen werden bald beginnen.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_05"); //Unser Orden wurde von Beliar berührt! Das Böse ist sehr stark, wenn es ihm gelingt, selbst hier Verbündete zu finden.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_06"); //Pedro war schon seit Jahren hier im Kloster. Ich glaube, die viele Zeit außerhalb dieser Mauern hat seinen Glauben geschwächt und ihn so anfällig für die Verlockungen Beliars gemacht.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_07"); //Du bist zur rechten Zeit gekommen. Innos selbst hätte den Zeitpunkt deines Erscheinens nicht besser wählen können.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_08"); //Du wirst als Retter des Auges in die Geschichte unseres Klosters eingehen.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_09"); //Die Nachrichten aus dem Minental sind erschreckend. Ich glaube, dass Innos uns eine schwere Prüfung auferlegt hat.
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_10"); //Es heißt, es gibt keine Nachricht von den Paladinen, die ins Minental ausgezogen sind. Der Hohe Rat wird am Besten wissen, was zu tun ist.
			};
		};	
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_11"); //Es heißt, wir werden mit der Hilfe unseres Herrn die Drachen vernichten. Der Zorn Innos' wird die Kreaturen Beliars treffen.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_12"); //Innos sei Dank, es gibt keine neue Krise. Wir müssen den Weg unseres Herrn weiter gehen, denn nur mit seiner Hilfe werden wir gegen das Böse bestehen können.

	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_3 (var c_NPC slf)
{
	DIA_NOV_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc					= Hlp_GetInstanceID(slf);
};
