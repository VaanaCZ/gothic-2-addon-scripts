// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************
instance DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_Hello_Info()
{	
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //Hey! Dein Gesicht kommt mir irgendwie bekannt vor.
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //Kann schon sein. Ich war auch in der Kolonie.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //Richtig ... was willst du?
};
	
// ************************************************************
// 			  					DieLage 
// ************************************************************
instance DIA_Jarvis_DieLage (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_DieLage_Condition;
	information	= DIA_Jarvis_DieLage_Info;
	permanent	= FALSE;
	description = "Wie ist die Lage?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //Wie ist die Lage?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Wir haben zurzeit ziemlichen Ärger. Es bilden sich gerade zwei Fronten unter uns Söldnern.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Sylvio und seine Leute zweifeln daran, dass Lee den richtigen Plan verfolgt.
};
	
// ************************************************************
// 			  					TwoFronts 
// ************************************************************
instance DIA_Jarvis_TwoFronts (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_TwoFronts_Condition;
	information	= DIA_Jarvis_TwoFronts_Info;
	permanent	= FALSE;
	description = "Wie kam es zu den zwei Fronten?";
};                       

FUNC INT DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_TwoFronts_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //Wie kam es zu den zwei Fronten?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //Der größte Teil von uns ist mit Lee damals aus der Kolonie gekommen.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //Aber einige der Söldner sind auch später zu uns gestoßen.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //Sie kamen nicht aus der Kolonie, sondern haben weiter südlich gegen die Orks gekämpft.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //Sie haben irgendwie davon Wind gekriegt, dass hier Leute gebraucht werden. Ihr Anführer war Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //Er hat sich zwar damit einverstanden erklärt, dass Lee hier das Kommando hat, aber jetzt versucht er, die Söldner gegen ihn und seinen Plan aufzuwiegeln.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //Viele von Lees Leuten glauben nicht, dass das ein großes Problem ist. Aber ich kenne die Typen wie Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //Er wird bis zum Äußersten gehen, um seine Vorstellungen umzusetzen.
};
	
// ************************************************************
// 			  					LeesPlan 
// ************************************************************
instance DIA_Jarvis_LeesPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_LeesPlan_Condition;
	information	= DIA_Jarvis_LeesPlan_Info;
	permanent	= FALSE;
	description = "Weißt du, was Lees Plan ist?";
};                       

FUNC INT DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_LeesPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //Weißt du, was Lees Plan ist?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Lee will, dass wir abwarten, und die Paladine in der Stadt aushungern.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //Er hat den Plan, uns alle von der Insel wegzubringen. Und Innos weiß, dass ich nichts dagegen hätte, von hier zu verschwinden.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //Ich weiß zwar nicht genau, wie er das anstellen will, aber ich vertraue ihm. Er hat uns bis jetzt gut geführt.
};

// ************************************************************
// 			  				SylviosPlan 
// ************************************************************
instance DIA_Jarvis_SylviosPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_SylviosPlan_Condition;
	information	= DIA_Jarvis_SylviosPlan_Info;
	permanent	= FALSE;
	description = "Weißt du, was Sylvio vorhat?";
};                       

FUNC INT DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //Weißt du, was Sylvio vorhat?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Sylvio hat mitbekommen, dass ein Teil der Paladine in die alte Kolonie aufgebrochen ist.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //Er meint, die restlichen Paladine würden es nicht wagen, uns hier anzugreifen, und will die Situation ausnutzen.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Die kleinen Höfe plündern, den Milizpatrouillen vor der Stadt auflauern, Reisende überfallen, solche Sachen eben.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //Aber Lee denkt, das wäre das Schlechteste, was wir in unserer Situation machen könnten.
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 6;
	condition	= DIA_Jarvis_WannaJoin_Condition;
	information	= DIA_Jarvis_WannaJoin_Info;
	permanent	= FALSE;
	description = "Ich will Söldner werden!";
};                       

FUNC INT DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //Ich will Söldner werden!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //Ich bin mir nicht sicher, ob das 'ne gute Idee ist ...
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //Wo ist das Problem?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //Na, ich muss entweder für oder gegen dich stimmen.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //Und bei der Lage, in der wir zurzeit stecken, werde ich dir meine Stimme nur geben, wenn ich sicher sein kann, dass du auf Lees Seite stehst!
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 7;
	condition	= DIA_Jarvis_MissionKO_Condition;
	information	= DIA_Jarvis_MissionKO_Info;
	permanent	= FALSE;
	description = "Was soll ich machen?";
};                       

FUNC INT DIA_Jarvis_MissionKO_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo (other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_MissionKO_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //Was soll ich machen?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //Ganz einfach. Hau ein paar von Sylvios Jungs um! Damit machst du beiden Seiten klar, zu wem du stehst.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //Und wenn du dich an die Duellregeln hältst, bringt dir das sogar noch den Respekt der anderen ein.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis will das ich ein paar von Sylvios Jungs umhaue, damit ich seine Stimme kriege.");
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_DuellRegeln_Condition;
	information	= DIA_Jarvis_DuellRegeln_Info;
	permanent	= FALSE;
	description = "Was sind die Duellregeln?";
};                       

FUNC INT DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_DuellRegeln_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //Was sind die Duellregeln?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //Geh zu Torlof und lass dir das von ihm erklären, wenn es dich interessiert.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //Damit wir uns richtig verstehen: Mir ist egal, ob du dich an die Regeln hältst oder nicht. Hauptsache, die Knaben landen bewusstlos im Dreck!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Dazu muss ich mich nicht mal an die Duellregeln halten...");
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_SylviosMen_Condition;
	information	= DIA_Jarvis_SylviosMen_Info;
	permanent	= FALSE;
	description = "Welche der Söldner gehören zu Sylvio?";
};                       

FUNC INT DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosMen_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //Welche der Söldner gehören zu Sylvio?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //Es sind sechs Männer. Zum einen Sylvio selbst und seine rechte Hand, Bullco.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //Dann sind da Rod, Sentenza, Fester und Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //Der Rest der Leute ist entweder neutral oder auf Lees Seite.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Zu Sylvios Männern zählen: Sylvio, seine rechte Hand Bullco, Rod, Sentenza, Fester und Raoul.");
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowMany_Condition;
	information	= DIA_Jarvis_HowMany_Info;
	permanent	= FALSE;
	description = "Wie viele von Sylvios Männern soll ich denn besiegen?";
};                       

FUNC INT DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowMany_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //Wie viele von Sylvios Männern soll ich denn besiegen?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //Wenn du drei von ihnen zu Boden schickst, hast du unter Beweis gestellt, auf welcher Seite du stehst.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //Wen du dir aussuchst, ist deine Sache.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //Nur ein kleiner Tipp: Es geht nicht darum, deinen Mut zu beweisen. Leg dich nicht mit Sylvio selbst an - der macht Hundefutter aus dir.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Es reicht, wenn ich drei von Sylvios Männern zu Boden schicke. mit Sylvio selbst, sollte ich mich besser nicht anlegen.");
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowManyLeft_Condition;
	information	= DIA_Jarvis_HowManyLeft_Info;
	permanent	= TRUE;
	description = "Wie viele von Sylvios Männern stehen noch auf meiner Liste?";
};                       

FUNC INT DIA_Jarvis_HowManyLeft_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowManyLeft_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //Wie viele von Sylvios Männern stehen noch auf meiner Liste?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //Ich habe Bullco besiegt.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //Hab ich mitgekriegt. Reife Leistung.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Rod sieht nicht mehr ganz so gut aus.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza wollte mir Gold abknöpfen - das war keine gute Idee von ihm.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //Sentenza hab ich zu Boden geschickt.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester hat versucht, mich zu verarschen - das war sein Fehler.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester ist erledigt.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //Und was Raoul betrifft ...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //Ich war bei Raoul ...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //Und?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //Er hatte die Schläge dringend nötig.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //Du hast bis jetzt noch keinen von Sylvios Männern zu Boden geschickt.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Gut - weiter so.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //Ich erwarte, dass du es mindestens drei von ihnen ordentlich zeigst.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //Das reicht, das reicht.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //Du hast dir tatsächlich alle vorgeknöpft, was?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //Ich bin beeindruckt - wenn Lee mich fragt, kann ich bedenkenlos für dich stimmen.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Jarvis stimmt für mich, wenn ich mich den Söldnern anschließen will.");
	};
};


// ###############################
// ##							##
// 			Höhere Gilden
// ##							##
// ###############################


// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= FALSE;
	description = "Irgendwelche Neuigkeiten?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //Irgendwelche Neuigkeiten?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //Du bist jetzt einer von uns. Das ist gut.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //Du hast die falsche Wahl getroffen, du hättest zu uns gehören können
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //Sylvios Leute haben sich in letzter Zeit ziemlich zurückgehalten. (lacht dreckig)
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Sylvio ist endlich abgezogen. Nachdem er von den Drachen gehört hat, ist er mit 'nem Teil seiner Jungs in die Minenkolonie aufgebrochen.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //Er war wohl der Meinung, da wäre mehr zu holen
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Nichts, soweit alles ruhig. Bin gespannt, wie das alles hier ausgeht.
		};
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jarvis_PICKPOCKET (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 900;
	condition	= DIA_Jarvis_PICKPOCKET_Condition;
	information	= DIA_Jarvis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen (41, 55);
};
 
FUNC VOID DIA_Jarvis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_BACK 		,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};
	
func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};





		





