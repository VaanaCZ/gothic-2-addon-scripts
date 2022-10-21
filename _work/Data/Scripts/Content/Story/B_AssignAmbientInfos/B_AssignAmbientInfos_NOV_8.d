// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_8_EXIT_Condition;
	information	= DIA_NOV_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_8_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_8_Fegen_Condition;
	information	= DIA_NOV_8_Fegen_Info;
	permanent	= TRUE;
	description = "Ich brauche Hilfe beim Fegen der Novizenkammern.";
};                       

FUNC INT DIA_NOV_8_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};
//-------------------------------
var int Feger3_Permanent;
//-------------------------------
FUNC VOID DIA_NOV_8_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Fegen_15_00"); //Ich brauche Hilfe beim Fegen der Novizenkammern.
	
	if (Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self))
	{	
		if (Feger3_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_01"); //Oh Mann. Du bist gerade mal hier und l�sst dir direkt die Fegerei aufs Auge dr�cken?
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_02"); //Tr�ste dich, mir ist es genauso gegangen, als ich hier neu war. Und deswegen helfe ich dir. W�re doch gelacht, wenn wir das nicht hinkriegen.
			
			NOV_Helfer = (NOV_Helfer +1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Ich habe einen Novizen gefunden, der mir hilft, die Kamemrn zu fegen.");
		}
		else //if (Feger3_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_03"); //Bruder, ich wei�, in welcher Situation du steckst. Und ich hab dir schon gesagt, dass ich dir helfe. Und das mach ich.
		};
	};
	//-------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------
	
	if ((Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self)) == FALSE )
	{	
		AI_Output (self, other, "DIA_NOV_8_Fegen_08_04"); //Hey, ich w�rd's ja tun, aber ich bin schwer besch�ftigt.
	};
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_8_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_8_Wurst_Condition;
	information	= DIA_NOV_8_Wurst_Info;
	permanent	= TRUE;
	description = "Wie w�r's mit 'ner leckeren Schafswurst?";
};                       

FUNC INT DIA_NOV_8_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Wurst_15_00"); //Wie w�r's mit 'ner leckeren Schafswurst?
	AI_Output (self, other, "DIA_NOV_8_Wurst_08_01"); //Da sage ich nicht nein. Danke Mann - das ist jetzt genau das Richtige.
	
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
INSTANCE DIA_NOV_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_8_JOIN_Condition;
	information	= DIA_NOV_8_JOIN_Info;
	permanent	= TRUE;
	description = "Was mu� ich tun, um Magier zu werden?";
};                       

FUNC INT DIA_NOV_8_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_JOIN_15_00"); //Was mu� ich tun, um Magier zu werden?
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_01"); //Ein Erw�hlter Innos' wirst du erst, wenn die Hohen Magier des Feuers es zulassen.
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_02"); //Als Novizen ist es uns untersagt, uns mit der Runenmagie zu befassen - und nur mit der Erlaubnis der Magier d�rfen wir die alten Schriften lesen.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_8_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_8_PEOPLE_Condition;
	information	= DIA_NOV_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer leitet das Kloster?";
};                       

FUNC INT DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_PEOPLE_15_00"); //Wer leitet das Kloster?
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_01"); //Der hohe Rat. Er wird gebildet von den drei m�chtigsten Magiern unseres Ordens. Sie beraten sich t�glich in der Kirche.
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_02"); //Die Erw�hlten Innos' sind allesamt Magier. Innos hat sie mit dieser Gabe ausgestattet, damit sie seinen Willen auf Erden durchsetzen k�nnen.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_8_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_8_LOCATION_Condition;
	information	= DIA_NOV_8_LOCATION_Info;
	permanent	= TRUE;
	description = "Erz�hl mir etwas �ber dieses Kloster.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_LOCATION_15_00"); //Erz�hl mir etwas �ber dieses Kloster.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_01"); //Es ist uralt. Es stammt noch aus der Zeit vor Rhobar, dem Ersten.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_02"); //Unter dem Kloster sind die Katakomben. Sie erstrecken sich bis tief in den Berg hinein.
	//AI_Output (self, other, "DIA_NOV_8_LOCATION_08_03"); //Aber zur untersten Ebene haben nur die h�chsten Geweihten Innos' Zutritt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_8_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_8_STANDARD_Condition;
	information	= DIA_NOV_8_STANDARD_Info;
	permanent	= TRUE;
	description = "Gibt's irgendwelche Neuigkeiten?";
};
                       
func INT DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_STANDARD_15_00"); //Gibt's irgendwelche Neuigkeiten?
		
	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_01"); //Das kann man wohl sagen. Es ist bestimmt schon seit �ber hundert Jahren nicht mehr vorgekommen, dass ein Novize in so kurzer Zeit in den Kreis des Feuers aufgenommen wurde!
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_02"); //Ich hoffe, dass auch mir eines Tages diese Ehre zuteil wird. Ich werde hart daf�r arbeiten.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_03"); //Vor Kurzem sind die Paladine in Khorinis eingetroffen. Einer von ihnen ist hier im Kloster, um zu beten.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_08_04"); //Ich kann es noch gar nicht glauben. Einer von uns hat das Kloster verraten und das Auge Innos' gestohlen.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_05"); //Es war unsere Aufgabe, eine Gemeinschaft zu bilden, doch wir waren zu schwach, nur so konnte es Beliar gelingen, einen der Unsrigen auf seine Seite zu ziehen.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_06"); //Innos sei gepriesen, wir konnten dem Feind das Auge Innos' wieder abnehmen.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_07"); //Dein Mut kann f�r viele verzweifelte Seelen ein Vorbild sein und ihnen helfen, diese dunklen Zeiten zu �berstehen.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_08"); //Ich habe von Drachen geh�rt und von einer Armee des B�sen. Innos steh uns bei!
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_09"); //Der hohe Rat ist sehr besorgt �ber die Situation, in der sich unsere Paladine befinden. Es gibt seit einiger Zeit schon keine Nachricht aus dem Minental.
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_10"); //Nein. Und ich danke unserem Herrn daf�r. Mit dem Auge Innos' wird es uns gelingen, die Drachen zu besiegen!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_11"); //Ja. Wir haben den Sieg �ber die Drachen errungen! Innos hat uns gezeigt, dass wir die Hoffnung niemals aufgeben d�rfen.
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_12"); //Doch es gibt viele Schatten und wir werden viele Feuer entz�nden m�ssen, um sie zu vertreiben.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_8 (var c_NPC slf)
{
	DIA_NOV_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc					= Hlp_GetInstanceID(slf);
};
