///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_EXIT   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 999;
	condition   = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pablo_PICKPOCKET (C_INFO)
{
	npc			= Mil_319_Pablo;
	nr			= 900;
	condition	= DIA_Pablo_PICKPOCKET_Condition;
	information	= DIA_Pablo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre ein Kinderspiel seinen Schlüssel zu stehlen)";
};                       

FUNC INT DIA_Pablo_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_01) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Pablo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pablo_PICKPOCKET);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_BACK 		,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Pablo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pablo_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info WANTED
///////////////////////////////////////////////////////////////////////
var int Pablo_belogen;
//--------------------

instance DIA_Pablo_WANTED		(C_INFO)
{
	npc			 = 	Mil_319_Pablo;
	nr			 = 	1;
	condition	 = 	DIA_Pablo_WANTED_Condition;
	information	 = 	DIA_Pablo_WANTED_Info;
	important	 = 	TRUE;
};
func int DIA_Pablo_WANTED_Condition ()
{
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
func void DIA_Pablo_WANTED_Info ()
{
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //Hey du, warte mal - du kommst mir bekannt vor.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //Was willst du ?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //Irgendwo habe ich dein Gesicht schon einmal gesehen ... ah - richtig!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Hier - dieses Bild haben wir bei ein paar Banditen gefunden, die wir vor ein paar Tagen aufgegriffen haben - das sieht dir ziemlich ähnlich.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Anscheinend haben die Kerle dich gesucht.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"Nein, das muss eine Verwechslung sein... ",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"Da wäre ich ja jetzt gar nicht von alleine drauf gekommen",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //Nein, das muss eine Verwechslung sein. Bei mir ist alles in Ordnung ...
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Ganz wie du willst, Fremder.
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie außerhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //Aber falls das DOCH deine Visage ist - und falls du Probleme hast - dann lass sie außerhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //Und Fremde, die Ärger in die Stadt bringen, bleiben nicht lange in der Stadt - ich hoffe, das war deutlich.
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //Da wäre ich jetzt gar nicht von alleine drauf gekommen.
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //Sehr witzig ... was wollten diese Kerle von dir?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Frag' sie doch selbst. Ihr habt sie doch sicher eingelocht, oder?
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //Nein - die sind tot.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //Dann werden wir es wohl nie erfahren.
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Schönen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //Falls du in Schwierigkeiten stecken sollest - sprich mal mit Lord Andre. Vielleicht kann er dir helfen. Du findest ihn in der Kaserne.
	
	AI_StopProcessInfos (self);
};

// *************************************************************
// 							Banditen
// *************************************************************
INSTANCE DIA_Pablo_Banditen   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent   = FALSE;
	description = "Was weißt du über die Banditen?";
};
FUNC INT DIA_Pablo_Banditen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Banditen_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_03"); //Was weißt du über die Banditen?
	//AI_Output (other, self, "DIA_Pablo_Banditen_15_00"); //Was weißt du über die Banditen, die vor der Stadt ihr Unwesen treiben?
	AI_Output (self ,other,"DIA_Pablo_Add_12_04"); //Sie kommen alle aus der verdammten Minenkolonie. Aber es gibt etliche Splittergruppen.
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //Einige haben sich in die Berge verkrochen und wieder andere haben sich dem Grossbauern Onar angeschlossen.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //Aber am meisten Probleme machen die Banditen, die sich in der Nähe der Stadt herumtreiben.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //Sie sind der Grund dafür, daß sich keiner der Händler mehr vor die Stadttore traut.
};

// *************************************************************
// 							HakonBandits
// *************************************************************
INSTANCE DIA_Pablo_HakonBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent   = FALSE;
	description = "Was weißt du über die Banditen, die den Händler Hakon überfallen haben?";
};
FUNC INT DIA_Pablo_HakonBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Miliz))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_HakonBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_20"); //Was weißt du über die Banditen, die den Händler Hakon überfallen haben?
	AI_Output (self ,other,"DIA_Pablo_Add_12_21"); //Ach, DIE Sache. Hör bloß auf...
	AI_Output (self ,other,"DIA_Pablo_Add_12_22"); //Soviel wir wissen, gehen eine ganze Menge der Händlerüberfälle auf ihr Konto.
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Diese Ratten haben sich in ihrem Loch verkrochen und trauen sich nicht mehr raus.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //Einmal konnten wir sie aufspüren und verfolgen. Aber im Wald vor der Stadt haben wir die Verfolgung abgebrochen.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //Da treiben sich zuviele Viecher rum, das ist viel zu gefährlich.
	
	B_LogEntry(TOPIC_HakonBanditen,"Die Banditen, die Hakon bestohlen haben, verstecken sich in einem der Wälder, nahe bei der Stadt." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //Aber da ist noch eine Sache...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //Ein paar der gestohlenen Waren sind in Khorinis aufgetaucht.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //Das heißt, sie wissen, wie sie die Ware in die Stadt bringen und sie verkaufen können ...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //Ja, wir vermuten, dass sie einen Hehler in der Stadt sitzen haben. Aber bisher ist es uns nicht gelungen, den Kerl zu erwischen.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //Falls du in der Sache was rauskriegen solltest, bei Lord Andre gibt's ein schönes Kopfgeld für den Hehler.
	
		B_LogEntry(TOPIC_HakonBanditen,"Wahrscheinlich haben die Banditen  Kontakt zu einem Hehler in der Stadt. Bei Lord Andre ist ein Kopfgeld auf den Hehler ausgesetzt." );
	};
}; 

// *************************************************************
// 							MyBandits
// *************************************************************
INSTANCE DIA_Pablo_MyBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 4;
	condition   = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent   = FALSE;
	description = "Woher kamen die Banditen, die meinen Steckbrief dabei hatten?";
};
FUNC INT DIA_Pablo_MyBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Wanted))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_MyBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //Woher kamen die Banditen, die meinen Steckbrief dabei hatten?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //AHA! Es ist also DOCH deine Visage. Warum hast du das nicht gleich zugegeben, he?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //(fordernd) Weswegen wirst du gesucht?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //Ich weiß es nicht - ehrlich!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Ja, ja. Schon klar. Ich sag dir was. Wenn ich glauben würde, daß du mit diesen Banditen unter einer Decke steckst, hätte ich dich schon längst eingelocht, klar?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //Trotzdem werde ich mal besser bei Lord Andre über diesen Vorfall Meldung machen...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //Aber - um deine Frage zu beantworten...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //Wir haben sie in der Nähe des Grossbauern aufgegriffen.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //Aber sie sahen nicht aus wie Onars Leute.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //Ich denke sie gehören zu einer kleineren Gruppe, die sich irgendwo in der Nähe von Onars Hof in den Bergen verkrochen hat.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //Aber wenn du vorhast, da hin zu gehen, muss ich dich warnen. Die Halsabschneider machen mit jedem kurzen Prozeß!
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //Ich werd's mir merken.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_Perm   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 1;
	condition   = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent   = TRUE;
	description = "Wie ist die Lage?";
};
FUNC INT DIA_Pablo_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Perm_Info()
{
	AI_Output (other, self, "DIA_Pablo_Perm_15_00"); //Wie ist die Lage?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //Ich hab immer gesagt, dass man diesen Söldnern nicht trauen kann.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //Es wird Zeit, dass wir diesem Abschaum mal eine Lektion erteilen. Das hat sich dieser Bennet doch nicht alleine ausgedacht.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //Ich bin tief erschüttert über den Mord am ehrenwerten Paladin Lothar.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //Aber ich weiß, dass die Kirche eine gerechte Strafe für den Frevler finden wird.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //Was streunerst du hier eigentlich rum? Wenn du versuchst, deinen Söldnerfreund zu befreien, das kannst du gleich vergessen.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //Es ist erbärmlich. Jetzt hetzt man uns schon gegeneinander auf.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //Wenn du es nicht geschafft hättest, den wahren Schuldigen für den Mord zu finden, hätten die Orks keinen Handschlag tun müssen.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //Ich mach mir Sorgen, was passiert, wenn jetzt die Paladine abziehen.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //Ihr könnt euch auf uns verlassen, wir werden mit allen uns zur Verfügung stehenden Mitteln dafür sorgen, dass diese Stadt nicht zum Sündenpfuhl verkommt.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //Pass bloß auf, was du hier machst. So Galgenvögel wie dich beobachten wir hier ganz genau.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //Zurzeit ist es ruhig. Nur die Banditen vor der Stadt machen uns Probleme.
	};	

}; 


