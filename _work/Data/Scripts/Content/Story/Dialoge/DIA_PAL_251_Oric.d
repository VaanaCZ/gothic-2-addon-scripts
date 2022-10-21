///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Oric_EXIT   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 999;
	condition   = DIA_Oric_EXIT_Condition;
	information = DIA_Oric_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Oric_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Oric_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_HALLO		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	4;
	condition	 = 	DIA_Oric_HALLO_Condition;
	information	 = 	DIA_Oric_HALLO_Info;
	permanent	 =  FALSE;
	description	 = 	"Was ist deine Aufgabe?";
};

func int DIA_Oric_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Oric_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Oric_HALLO_15_00"); //Was ist deine Aufgabe?
	AI_Output (self, other, "DIA_Oric_HALLO_11_01"); //Ich bin strategischer Offizier des Königs und zurzeit dem ehrenwerten Kommandanten Garond unterstellt.
	AI_Output (self, other, "DIA_Oric_HALLO_11_02"); //Wir sind die letzten Paladine hier in der Burg. Alle anderen sind unterwegs oder gefallen.
	AI_Output (self, other, "DIA_Oric_HALLO_11_03"); //Es liegt nun an uns, diese Expedition zu einem guten Ende zu bringen. Und das werden wir. Bei Innos - das werden wir.

};

///////////////////////////////////////////////////////////////////////
//	Info Bruder
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Bruder		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	4;
	condition	 = 	DIA_Oric_Bruder_Condition;
	information	 = 	DIA_Oric_Bruder_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich habe eine Nachricht für dich.";
};

func int DIA_Oric_Bruder_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Jergan_Burg)
	&& Npc_KnowsInfo (other, DIA_Oric_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Oric_Bruder_Info ()
{
	AI_Output (other, self, "DIA_Oric_Bruder_15_00"); //Ich habe eine Nachricht für dich.
	AI_Output (self, other, "DIA_Oric_Bruder_11_01"); //Was gibt's?
	AI_Output (other, self, "DIA_Oric_Bruder_15_02"); //Dein Bruder ist tot. Er ist bis zum Pass gekommen.
	AI_Output (self, other, "DIA_Oric_Bruder_11_03"); //(murmelt) ... mein Bruder ...
	AI_Output (self, other, "DIA_Oric_Bruder_11_04"); //Innos stellt mich auf eine harte Probe. Doch er starb, als sein Diener ...
	AI_Output (self, other, "DIA_Oric_Bruder_11_05"); //Diese Nachricht ist wie ein Pfeil, der sich in mein Herz bohrt. Ich werde neue Kraft im Gebet suchen.
	OricBruder = TRUE;
	
	B_GivePlayerXP (XP_Ambient);
};

	
//*****************************************
//	Minen Auftrag
//*****************************************

INSTANCE DIA_Oric_ScoutMine   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 1;
	condition   = DIA_Oric_ScoutMine_Condition;
	information = DIA_Oric_ScoutMine_Info;
	permanent   = FALSE;
	description = "Ich soll die Schürfstellen aufsuchen.";
};

FUNC INT DIA_Oric_ScoutMine_Condition()
{
	if 	(MIS_ScoutMine == LOG_RUNNING)
	&&	(Kapitel < 3)
	&& 	(Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&&  (Fajeth_Ore == FALSE)
	&&  (Marcos_Ore == FALSE)
	&&  (Silvestro_Ore == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_ScoutMine_Info()
{
	AI_Output (other,self ,"DIA_Oric_ScoutMine_15_00"); //Ich soll die Schürfstellen aufsuchen.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_01"); //Das wird kein Kinderspiel sein, sieh dich vor. Suche vor allem die Paladine auf. Sie führen die drei Gruppen an.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_02"); //Wenn du mehr darüber wissen willst, sprich mit Parcival.
};	
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Perm		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	99;
	condition	 = 	DIA_Oric_Perm_Condition;
	information	 = 	DIA_Oric_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"Wie ist die Lage?";
};

func int DIA_Oric_Perm_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Oric_Perm_Info ()
{
	
	AI_Output (other, self, "DIA_Oric_Perm_15_00"); //Wie ist die Lage?
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_01"); //Du musst alle Schürfer und das Erz finden. Dann werden wir uns darum kümmern, wie wir dieses Tal verlassen können.
	}
	else if (MIS_ScoutMine == LOG_SUCCESS)
 	{
		AI_Output (self, other, "DIA_Oric_Perm_11_02"); //Die Expedition ist an einem Tiefpunkt angelangt. Doch wir werden nicht aufgeben, denn Innos ist bei uns. Er wird uns sicher aus dem Tal führen.
	}
	else //noch nicht angenommen
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_03"); //Dein Erscheinen hier ist für uns ein Zeichen der Hoffnung.
		AI_Output (self, other, "DIA_Oric_Perm_11_04"); //Wir brauchen dich. Sprich mit Garond - er wird dir alles erklären.
	};
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

INSTANCE DIA_Oric_KAP3_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP3_EXIT_Condition;
	information	= DIA_Oric_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP3_EXIT_Info()
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

INSTANCE DIA_Oric_KAP4_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP4_EXIT_Condition;
	information	= DIA_Oric_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*****************************************
//	Kann ich irgendwie helfen?
//*****************************************

INSTANCE DIA_Oric_IAmBack   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 4;
	condition   = DIA_Oric_IAmBack_Condition;
	information = DIA_Oric_IAmBack_Info;

	description = "Ich bin schon wieder zurück.";
};

FUNC INT DIA_Oric_IAmBack_Condition()
{
	if 	(Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Oric_HALLO))
		{
				return TRUE;
		};
};

FUNC VOID DIA_Oric_IAmBack_Info()
{
	AI_Output (other,self ,"DIA_Oric_IAmBack_15_00"); //Ich bin schon wieder zurück.
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_01"); //Ich hätte nicht gedacht, dass wir dich noch mal wieder sehen, nach deinem Auftritt hier vor ein paar Tagen.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_02"); //Ich heiße dich in unserem Orden willkommen.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_03"); //Wie ich sehe, bist du zum Magier ernannt worden. Meine Ehrerbietung.
	};
	
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_04"); //Vielleicht ist dein Auftauchen ein gutes Omen.
};

//***********************************************
//	Kann ich helfen?
//***********************************************

INSTANCE DIA_Oric_CanHelp   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 4;
	condition   = DIA_Oric_CanHelp_Condition;
	information = DIA_Oric_CanHelp_Info;

	description = "Kann ich helfen?";
};

FUNC INT DIA_Oric_CanHelp_Condition()
{
	if 	(Kapitel >= 4)
	&&	(Npc_KnowsInfo (other,DIA_Oric_IAmBack))
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_CanHelp_Info()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_15_00"); //Kann ich helfen?
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_01"); //Im Moment haben wir eigentlich alles getan, was von hier aus möglich ist.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_02"); //Allerdings gibt es da etwas. Etwas sehr Wichtiges, was du für uns außerhalb der Mauern hier tun könntest.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_03"); //Wir haben vor, der Schlange den Kopf abzuschlagen.
	
	Info_ClearChoices (DIA_Oric_CanHelp);
	Info_AddChoice (DIA_Oric_CanHelp,"Ich glaube, du solltest dir einen anderen suchen.",DIA_Oric_CanHelp_NotYourMan); 
	Info_AddChoice (DIA_Oric_CanHelp,"Was meinst du damit?",DIA_Oric_CanHelp_WhatYouMean);

};

FUNC VOID DIA_Oric_CanHelp_NotYourMan ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_NotYourMan_15_00"); //Ich glaube, du solltest dir einen anderen suchen.
	AI_Output (self ,other,"DIA_Oric_CanHelp_NotYourMan_11_01"); //Ich kann keinen Mann entbehren, du bist unsere einzige Hoffnung.
};

FUNC VOID DIA_Oric_CanHelp_WhatYouMean ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_00"); //Was meinst du damit?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_01"); //Wir kennen einen von ihren Anführern. Er heißt Hosh-Pak.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_02"); //Er ist einer der einflussreichsten Schamanen bei den Orks.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_03"); //Und was ist meine Rolle?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_04"); //Töte ihn.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_05"); //Das ist ein Scherz!?

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_06"); //Du bist der Einzige von uns, den wir hier entbehren können. Alle anderen Ritter werden hier gebraucht.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_07"); //Es fällt mir schwer, dich darum zu bitten, Meister. Aber du wärst die beste Wahl für diesen Auftrag.
	}
	else
	{	
		AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_08"); //Du willst uns doch helfen, oder nicht? Na, also.
	};
	
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_09"); //Hosh-Paks Zelt befindet abseits des Belagerungsrings südlich von hier auf einer Klippe.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_10"); //Von einem der Fenster dort kannst du es beinahe sehen.
	

	Info_ClearChoices (DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};

//***********************************************
//	Ich brauche noch Ausrüstung.
//***********************************************

INSTANCE DIA_Oric_NeedStuff   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 6;
	condition   = DIA_Oric_NeedStuff_Condition;
	information = DIA_Oric_NeedStuff_Info;

	description = "Ich brauche noch Ausrüstung.";
};

FUNC INT DIA_Oric_NeedStuff_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_NeedStuff_Info()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_15_00"); //Ich brauche noch Ausrüstung.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_01"); //Wir haben nicht mehr viel, was wir dir geben könnten.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_02"); //Also, ich kann dir folgendes anbieten.
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
	Info_AddChoice (DIA_Oric_NeedStuff,"oder 1 Elixier der Geschicklichkeit",DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice (DIA_Oric_NeedStuff,"oder 1 Elixier der Stärke",DIA_Oric_NeedStuff_Strength);
	Info_AddChoice (DIA_Oric_NeedStuff,"oder 3 Mana Elixiere",DIA_Oric_NeedStuff_Mana);	
	Info_AddChoice (DIA_Oric_NeedStuff,"3 Elixiere der Heilung",DIA_Oric_NeedStuff_Health); 
};

FUNC VOID DIA_Oric_NeedStuff_Health ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Health_15_00"); //Ich nehme die Heiltränke.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Health_11_01"); //Eine gute Wahl. Mögen sie dir von Vorteil sein.
	
	CreateInvItems (self,ItPo_Health_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Mana ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Mana_15_00"); //Ich nehme die Manatränke.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Mana_11_01"); //Ich hoffe, du kannst sie gebrauchen. Möge Innos dich schützen.
	
	CreateInvItems (self,ItPo_Mana_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Strength ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Strength_15_00"); //Ich nehme das Elixier der Stärke.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Strength_11_01"); //Hier, er wird sicherlich von Nutzen sein. Viel Glück.

	CreateInvItems (self,ItPo_Perm_STR,1);
	B_GiveInvItems (self ,other,ItPo_Perm_STR,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Dexterity ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Dexterity_15_00"); //Ich nehme das Elixier der Geschicklichkeit.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Dexterity_11_01"); //Mögen deine Pfeile immer ihr Ziel treffen. Hier hast du es.

	CreateInvItems (self,ItPo_Perm_DEX,1);
	B_GiveInvItems (self ,other,ItPo_Perm_DEX,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

//***********************************************
//	ich werde keinen feigen Mord begehen.
//***********************************************

INSTANCE DIA_Oric_NoMurder   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 7;
	condition   = DIA_Oric_NoMurder_Condition;
	information = DIA_Oric_NoMurder_Info;

	description = "Ich werde keinen feigen Mord an Hosh-Pak begehen.";
};

FUNC INT DIA_Oric_NoMurder_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_NoMurder_Info()
{
	AI_Output (other,self ,"DIA_Oric_NoMurder_15_00"); //Ich werde keinen feigen Mord an Hosh-Pak begehen.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_01"); //Kannst du dir überhaupt ausmalen, wie schlecht unsere Lage ist?
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_02"); //Wir werden von einer uns überlegenen Armee der Orks belagert. Unsere Vorräte sind fast verbraucht.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_03"); //Wenn es uns nicht gelingt, das Erz zum Schiff zu bringen, dann werden die Orks unser gesamtes Königreich verwüsten.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_04"); //Alles, wofür wir stehen, wird in Vergessenheit geraten.
};

//***********************************************
//	Ich werde dir helfen
//***********************************************

INSTANCE DIA_Oric_WillHelp   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 5;
	condition   = DIA_Oric_WillHelp_Condition;
	information = DIA_Oric_WillHelp_Info;
	permanent   = FALSE;
	description = "Gut. Ich werde Hosh-Pak töten.";
};

FUNC INT DIA_Oric_WillHelp_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	MIS_KillHoshPak == FALSE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_WillHelp_Info()
{
	AI_Output (other,self ,"DIA_Oric_WillHelp_15_00"); //Gut. Ich werde Hosh-Pak töten.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_01"); //Das freut mich zu hören.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_02"); //Das Zelt von Hosh-Pak steht auf einer kleinen Klippe. Du müsstest sie eigentlich schon gesehen haben.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_03"); //Sie ist nicht weit von dem Weg zu unserer Mine. Direkt im Schatten des großen Berges.
	
	Log_CreateTopic (TOPIC_KillHoshPak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak, LOG_RUNNING);
	B_LogEntry (TOPIC_KillHoshPak,"Oric will, dass ich dem hohen Orkshamanen HOSH-PAK das Handwerk lege. Sein Zelt steht auf einer kleinen Klippe nicht weit entfernt von der Rückseite der Burg."); 

	MIS_KillHoshPak = LOG_RUNNING;
};

//***********************************************
//	Hosh-Pak ist tot!
//***********************************************

INSTANCE DIA_Oric_HoshDead   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 8;
	condition   = DIA_Oric_HoshDead_Condition;
	information = DIA_Oric_HoshDead_Info;
	permanent   = FALSE;
	description = "Hosh-Pak ist tot!";
};

FUNC INT DIA_Oric_HoshDead_Condition()
{
	if 	(Npc_IsDead (Hosh_Pak))
	&& 	(MIS_KillHoshPak == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_HoshDead_Info()
{
	AI_Output (other,self ,"DIA_Oric_HoshDead_15_00"); //Hosh-Pak ist tot!
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_01"); //Gut, das wird die Orks verunsichern. Vielleicht haben wir ja doch noch eine Chance.
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_02"); //Ich denke, das wird uns einen Aufschub von mindestens einer Woche geben.
	
	MIS_KillHoshPak = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillHosh_Pak);
};



//***********************************************
//	Irgendwelche Neuigkeiten?
//***********************************************

INSTANCE DIA_Oric_AnyNews   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 9;
	condition   = DIA_Oric_AnyNews_Condition;
	information = DIA_Oric_AnyNews_Info;
	permanent	 = 	TRUE;

	description = "Irgendwelche Neuigkeiten?";
};

FUNC INT DIA_Oric_AnyNews_Condition()
{
	if 	(Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_AnyNews_Info()
{

	AI_Output (other,self ,"DIA_Oric_AnyNews_15_00"); //Irgendwelche Neuigkeiten?
	
	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_01"); //Na, was schon? Die Orks sind hier eingefallen.
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_02"); //Ja. Du bist unser Held. Alle Drachen auf einmal los zu werden ist schon eine beachtliche Leistung, würde ich sagen.
	}
	else if (MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_03"); //Hosh-Paks Tod scheint die Orks verunsichert zu haben.
	}
	else
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_04"); //Die Orks werden immer zahlreicher. Wenn das bloß gut geht.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_DragonPlettBericht		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	3;
	condition	 = 	DIA_Oric_DragonPlettBericht_Condition;
	information	 = 	DIA_Oric_DragonPlettBericht_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich brauche mehr Informationen über die Drachen.";
};

func int DIA_Oric_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	&& (MIS_AllDragonsDead == FALSE)
	{
		return TRUE;
	};
};

var int Oric_SwampdragonInfo_OneTime;
var int Oric_RockdragonInfo_OneTime;
var int Oric_FiredragonInfo_OneTime;
var int Oric_IcedragonInfo_OneTime;
var int Oric_DragonCounter;
var int Oric_FirstQuestion;
func void DIA_Oric_DragonPlettBericht_Info ()
{
	AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_00"); //Ich brauche mehr Informationen über die Drachen.
	
	if (MIS_KilledDragons == 1)
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_01"); //Einen von ihnen habe ich schon getötet. Kannst du mir sagen, wo ich die anderen finde?
	}
	else if (MIS_KilledDragons != 0) 
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_02"); //Ich habe das Gefühl, dass ich noch nicht alle Drachen erwischt habe. Vielleicht habe ich noch etwas übersehen?
	};
	
	if ((Oric_DragonCounter < MIS_KilledDragons) || (Oric_FirstQuestion == FALSE))
	&& 	((Oric_SwampdragonInfo_OneTime == FALSE)
		||	(Oric_RockdragonInfo_OneTime == FALSE)
		||	(Oric_FiredragonInfo_OneTime == FALSE)
		||	(Oric_IcedragonInfo_OneTime == FALSE))
	{
		if ((Npc_IsDead(Swampdragon))== FALSE)
		&& (Oric_SwampdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_03"); //Westlich der alten Burg, hat sich in den letzten Tagen ein ziemlich großes Sumpfgebiet gebildet. Ziemlich verdächtig, findest du nicht?
			B_LogEntry (TOPIC_DRACHENJAGD,"Ich bekam von Oric den Hinweis, dass sich westlich der Burg ein ziemlich großes Sumpfgebiet gebildet hat in den letzten Tagen. Seiner Meinung nach sehr verdächtig."); 
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(Rockdragon))==FALSE)
		&& (Oric_RockdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_04"); //Es gibt da eine Felsenfestung im Süden, noch weit hinter dem Vulkan.
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_05"); //Unsere Späher haben berichtet, dass die Festung schwer bewacht ist. Vielleicht verbirgt sich dort einer von ihnen.
			B_LogEntry (TOPIC_DRACHENJAGD,"Die Späher der Paladine haben Oric berichtet, dass die Felsenfestung im Süden hinter dem Vulkan schwer bewacht sei. Oric vermutet dort einen Drachen."); 
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(FireDragon))==FALSE)
		&& (Oric_FiredragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_06"); //Nach dem letzten Angriff der Drachen soll einer von ihnen bei dem Vulkan im Süden verschwunden sein. Ich würde dort nach ihm suchen.
			B_LogEntry (TOPIC_DRACHENJAGD,"Der letzte Drache, der die Burg im Minental angegriffen hat, soll nach dem Angriff in der Nähe des Vulkans gesehen worden sein."); 
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(IceDragon))==FALSE)
		&& (Oric_IcedragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_07"); //Es gibt eine sehr weitläufige Eisregion im Westen. Würde mich nicht überraschen, wenn sich einer der Drachen dort versteckt hielte.
			B_LogEntry (TOPIC_DRACHENJAGD,"Die Eisregion im Westen ist laut Oric ein potentielle Behausung für einen Drachen."); 
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_08"); //Im Moment hab ich leider nichts für dich.
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

INSTANCE DIA_Oric_KAP5_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP5_EXIT_Condition;
	information	= DIA_Oric_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Oric_KAP6_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP6_EXIT_Condition;
	information	= DIA_Oric_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Oric_PICKPOCKET (C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 900;
	condition	= DIA_Oric_PICKPOCKET_Condition;
	information	= DIA_Oric_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre verdammt schwierig seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Oric_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (85 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Oric_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Oric_PICKPOCKET);
	Info_AddChoice		(DIA_Oric_PICKPOCKET, DIALOG_BACK 		,DIA_Oric_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Oric_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Oric_PICKPOCKET_DoIt);
};

func void DIA_Oric_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 85)
	{
		B_GiveInvItems (self, other, ITSc_PalRepelEvil, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Oric_PICKPOCKET);
	}
	else
	{	
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Oric_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Oric_PICKPOCKET);
};

