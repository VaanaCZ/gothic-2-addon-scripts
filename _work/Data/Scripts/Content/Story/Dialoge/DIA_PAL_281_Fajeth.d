FUNC INT C_SnapperDeath()
{
	if  Npc_IsDead(NewMine_Snapper1) 
	&& 	Npc_IsDead(NewMine_Snapper2)
	&& 	Npc_IsDead(NewMine_Snapper3)
	&& 	Npc_IsDead(NewMine_Snapper4)
	&& 	Npc_IsDead(NewMine_Snapper5)
	&& 	Npc_IsDead(NewMine_Snapper6)
	&& 	Npc_IsDead(NewMine_Snapper7)
	&& 	Npc_IsDead(NewMine_Snapper8)
	{
		return TRUE;
	}; 

};
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fajeth_EXIT   (C_INFO)
{
	npc         = PAL_281_Fajeth;
	nr          = 999;
	condition   = DIA_Fajeth_EXIT_Condition;
	information = DIA_Fajeth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fajeth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fajeth_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

/* 
	Seit einiger Zeit suchen wir in diesem verfluchten Gebiet eine Stelle, die noch erzhaltiges Gestein enthält, 
	nicht ständig von Orkpatroullien heimgesucht wird, wo die dauernden Drachenangriffe ausbleiben!
	Wir sind völlig verdreckt und ausgehungert, haben unzählige Kämpfe ausgetragen 
	und haben endlich hier den Funken einer Hoffnung gefunden bei diesem dreckigen Loch in der Erde dort drüben unseren praktisch unmöglichen Auftrag zu erledigen.
	Und da kommt einer wie du daher und besitzt die Frechheit uns zu sagen, wir seien überfällig! Entweder bist du völlig verrückt oder einfach nur unverschämt!
*/
///////////////////////////////////////////////////////////////////////	
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_First		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_First_Condition;
	information	 = 	DIA_Fajeth_First_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Fajeth_First_Condition ()
{
	if (Garond.aivar[AIV_TalkedToPlayer] == FALSE) 
	{
			return TRUE;
	};
};
func void DIA_Fajeth_First_Info ()
{
	AI_Output (self, other, "DIA_Fajeth_First_12_00"); //Wer bist du und was machst du hier?
	AI_Output (other, self, "DIA_Fajeth_First_15_01"); //Ich bin im Auftrag von Lord Hagen unterwegs ...
	AI_Output (self, other, "DIA_Fajeth_First_12_02"); //Dann solltest du versuchen, die Burg zu erreichen. Dort sitzt Kommandant Garond. Er ist der oberste Befehlshaber dieser Expedition.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Hallo		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_Hallo_Condition;
	information	 = 	DIA_Fajeth_Hallo_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Fajeth_Hallo_Condition ()
{
	if (MIS_ScoutMine == LOG_RUNNING) 
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_00"); //Woher kommst du?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_01"); //Ich komme im Auftrag von Garond ...
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_02"); //Sehr gut. Neue Männer kann ich gut gebrauchen.
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_03"); //Ich bin nicht hier, um euch zu unterstützen.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_04"); //Nein? Warum bist du dann gekommen?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_05"); //Mein Auftrag ist, in Erfahrung zu bringen, wie viel Erz ihr bisher gefördert habt.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_06"); //Ehrwürdiger Magier. Deine Anwesenheit gibt mir und meinen Männern Zuversicht.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_07"); //Doch wäre es für uns hilfreich, wenn du deine, dir von Innos verliehene Kraft, für uns einsetzen könntest.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Was kann ich für dich tun?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Meine Mission hat Vorrang.",DIA_Fajeth_Hallo_KDFNein);	
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_08"); //Und mein Auftrag lautet, alles zu unternehmen, was ich für nötig halte, um das Erz zu fördern und zu schützen.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_09"); //Dazu gehört auch das Requirieren von Männern. Du stehst im Dienste Innos' - also wirst du meinen Befehlen Folge leisten.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Was kann ich für dich tun?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ich habe bereits einen Befehl, von Garond. ",DIA_Fajeth_Hallo_MILNein);	
	}
	else //GIL_SLD
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_10"); //Hör zu - ich weiß nicht, warum Garond mir einen Söldner schickt - aber er wird einen Grund haben.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_11"); //Doch bevor ich dich zurückschicke, wirst du einen Auftrag für mich erledigen.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Alles hat seinen Preis.",DIA_Fajeth_Hallo_SLDJa);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Nein, ich habe keine Zeit,...",DIA_Fajeth_Hallo_SLDNein);	
	};
}; 
FUNC VOID DIA_Fajeth_Hallo_Tun () //Mission
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_Tun_15_00"); //Was kann ich für dich tun?
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_01"); //Seit Tagen schon streift eine Horde Snapper um unser Lager herum. Scheint so, als warten sie nur auf eine gute Gelegenheit, uns anzugreifen.
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_02"); //Ich weiß nicht, worauf sie warten - aber solange sie hier sind, ist an Ruhe im Lager nicht zu denken.

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_03"); //Vor allem dieser Fed hat die Hosen voll - und macht die anderen Sträflinge damit verrückt.
	};

	if ((Npc_IsDead(Bilgot)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_04"); //Also wen soll ich schicken? Bilgot? Ha - der ist auch schon völlig kaputt.
	};

	if ((Npc_IsDead(Tengron)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_05"); //Und Tengron? Er kann zwar kämpfen, aber ihm fehlt die nötige Raffinesse.
	};
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_06"); //Der einzige, der das machen kann, bist du. Ich will, dass du diese verdammten Bestien jagst und tötest.
	
	Wld_InsertNpc	(NewMine_Snapper7,"OW_PATH_333");	//Joly: Zur Sicherheit, falls keine mehr da sind.
	Wld_InsertNpc	(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc	(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");	

	MIS_Fajeth_Kill_Snapper = LOG_RUNNING;
	Log_CreateTopic (TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FajethKillSnapper,LOG_RUNNING);
	B_LogEntry (TOPIC_FajethKillSnapper,"Fajeth hat mich beauftragt die Snapper zu jagen, die seit Tagen um das Lager streifen.");
	
	Info_ClearChoices (DIA_Fajeth_Hallo);
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
FUNC VOID DIA_Fajeth_Hallo_KDFNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_KDFNein_15_00"); //Meine Mission hat Vorrang. Ich kann dir nicht helfen.
	AI_Output (self, other, "DIA_Fajeth_Hallo_KDFNein_12_01"); //Natürlich, Ehrwürdiger. Ich werde dich über alles informieren, was du zu wissen wünscht.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
FUNC VOID DIA_Fajeth_Hallo_MILNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_MILNein_15_00"); //Ich habe bereits einen Befehl, von Garond.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_01"); //Und den wirst du auch ausführen. Aber erst dann, wenn ICH dich zurückschicke.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_02"); //Alles, was ich jetzt noch von dir hören will ist: 'Was kann ich für dich tun'. Verstanden?
};
FUNC VOID DIA_Fajeth_Hallo_SLDJa ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDJa_15_00"); //Alles hat seinen Preis. Wenn du mich bezahlen kannst, überlege ich es mir.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_01"); //Ich bin es nicht gewohnt, mit Söldnern Geschäfte zu machen. Ich hasse das Gefeilsche um einen besseren Preis.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_02"); //Aber als Zeichen meines guten Willens zahle ich dir 100 Goldstücke, wenn du für mich arbeitest.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_03"); //Haben wir eine Abmachung?
	Fajeth_Pay = TRUE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Was kann ich für dich tun?",DIA_Fajeth_Hallo_Tun);	
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Nein, ich habe keine Zeit,...",DIA_Fajeth_Hallo_SLDNein);	
};
FUNC VOID DIA_Fajeth_Hallo_SLDNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDNein_15_00"); //Nein, ich habe keine Zeit, mich um dein Problem zu kümmern.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_01"); //Du schlägst leicht verdientes Gold aus? Das hätte ich von einem Söldner nicht erwartet.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_02"); //Da du uns also nicht helfen willst, schlage ich vor, du stellst deine Fragen und verschwindest dann wieder.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
///////////////////////////////////////////////////////////////////////	
//	Info Leader
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Leader		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_Leader_Condition;
	information	 = 	DIA_Fajeth_Leader_Info;
	permanent 	 =  FALSE;
	description	 =  "Ich habe den Rudelführer erlegt.";
};
func int DIA_Fajeth_Leader_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER) 
  	&&  Npc_IsDead(NewMine_LeadSnapper) 
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
			return TRUE;
	};
};
func void DIA_Fajeth_Leader_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Leader_15_00"); //Ich habe den Rudelführer erlegt.
	AI_Output (self, other, "DIA_Fajeth_Leader_12_01"); //Gut. Ohne Anführer sind sie nur noch halb so gefährlich. Ich denke, jetzt werden sie uns nicht mehr angreifen.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_Leader_12_02"); //Hier ist dein Gold - wie abgemacht.
		B_GiveInvItems (self, other, ItMi_Gold,100); 
	};
	
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_FajethKillSnapper);
		
		
};
///////////////////////////////////////////////////////////////////////
//	Info SNAPPER_Killed
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_SNAPPER_KILLED		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_SNAPPER_KILLED_Condition;
	information	 = 	DIA_Fajeth_SNAPPER_KILLED_Info;
	permanent	 = 	TRUE;
	description	 = 	"Die Snapper sind erledigt.";
};

func int DIA_Fajeth_SNAPPER_KILLED_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	&& (C_SnapperDeath() == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_SNAPPER_KILLED_Info ()
{
 		
	AI_Output (hero, self, "DIA_Fajeth_SNAPPER_KILLED_15_00"); //Die Snapper sind erledigt.
	AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_01"); //Gute Arbeit. Mit all den anderen Viechern da draußen werden wir wohl fertig.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_02"); //Dein Gold hast du dir verdient - hier sind 100 Goldstücke, wie abgemacht.
		B_GiveInvItems (self, other, ItmI_Gold,100); 
	};					
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_FajethKillSnapper);
};
///////////////////////////////////////////////////////////////////////
//	Info Running
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Running		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_Running_Condition;
	information	 = 	DIA_Fajeth_Running_Info;
	permanent	 =  TRUE;
	description  =  "Wie ist die Moral deiner Männer?";
};

func int DIA_Fajeth_Running_Condition ()
{
	if  (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Running_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Running_15_00"); //Wie ist die Moral deiner Männer?
	AI_Output (self, other, "DIA_Fajeth_Running_12_01"); //Du willst wissen, wie die Moral meiner Männer ist? Die können vor Angst kaum noch arbeiten!
	AI_Output (self, other, "DIA_Fajeth_Running_12_02"); //Erledige diese Snapper, sonst dreht noch einer durch!
};
///////////////////////////////////////////////////////////////////////
//	Info Belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_BELOHNUNG		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	3;	
	condition	 = 	DIA_Fajeth_BELOHNUNG_Condition;
	information	 = 	DIA_Fajeth_BELOHNUNG_Info;
	permanent	 =  FALSE;
	description	 = 	"Sag mir, wieviel Erz ihr bisher gefördert habt.";
};

func int DIA_Fajeth_BELOHNUNG_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	|| (MIS_Fajeth_Kill_Snapper == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_BELOHNUNG_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_00"); //Sag mir, wieviel Erz ihr bisher gefördert habt.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_01"); //Richte Garond aus, dass wir bisher nur ZWEI Kisten Erz fördern konnten.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_02"); //Durch die ständigen Angriffe habe ich bereits zu viele Verluste hinnehmen müssen.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_03"); //Wenn mir Garond mehr Männer schicken kann, dann können wir auch mehr Erz fördern.
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_04"); //Verstehe. Ich sag ihm Bescheid.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_05"); //Gut. Dann liegt jetzt alles weitere bei dir. Wir werden hier die Stellung halten, so lange wir können.
	
	Fajeth_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Die Schürfer von Fajeth haben bisher ZWEI Kisten Erz gefördert.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Perm2		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_Perm2_Condition;
	information	 = 	DIA_Fajeth_Perm2_Info;
	permanent	 =  TRUE;
	description  =  "Wie läuft die Erzförderung?";
};

func int DIA_Fajeth_Perm2_Condition ()
{
	if  Npc_KnowsInfo (other,DIA_Fajeth_BELOHNUNG)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Perm2_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Perm2_15_00"); //Wie läuft die Erzförderung?
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_01"); //Schlecht. Wir machen keine Fortschritte.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_02"); //Als wir ankamen, lief es noch gut - aber meine Jungs haben seitdem fast nur noch Splitter geschürft. Nichts Verwendbares.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_03"); //Aber wir werden nicht aufgeben - jedenfalls nicht, solange ich hier das Kommando habe.
};
//#####################################################################
//##
//##
//##							KAPITEL 3 und höher
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Erzabbau
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_ERZABBAU		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr			 = 	11;
	condition	 = 	DIA_Fajeth_ERZABBAU_Condition;
	information	 = 	DIA_Fajeth_ERZABBAU_Info;
	permanent	 = 	TRUE;
	description	 = 	"Wie läuft der Erzabbau?";
};

func int DIA_Fajeth_ERZABBAU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Fajeth_BELOHNUNG))
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_ERZABBAU_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_00"); //Wie läuft der Erzabbau?
	
	if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_01"); //Es ist hier ruhiger geworden. Woran mag das liegen?
		AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_02"); //Die Drachen sind tot.
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_03"); //Na, dann hoffe ich mal, dass meine Ablösung bald kommt. Ich dreh hier langsam durch.
	}
	else 
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_04"); //Das siehst du doch selber. Miserabel.
	};
};





// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fajeth_PICKPOCKET (C_INFO)
{
	npc			= PAL_281_Fajeth;
	nr			= 900;
	condition	= DIA_Fajeth_PICKPOCKET_Condition;
	information	= DIA_Fajeth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Fajeth_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Fajeth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fajeth_PICKPOCKET);
	Info_AddChoice		(DIA_Fajeth_PICKPOCKET, DIALOG_BACK 		,DIA_Fajeth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fajeth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fajeth_PICKPOCKET_DoIt);
};

func void DIA_Fajeth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fajeth_PICKPOCKET);
};
	
func void DIA_Fajeth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fajeth_PICKPOCKET);
};


