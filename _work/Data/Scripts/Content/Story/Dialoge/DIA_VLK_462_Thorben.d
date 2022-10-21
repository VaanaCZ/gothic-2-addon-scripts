// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thorben_EXIT(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 999;
	condition	= DIA_Thorben_EXIT_Condition;
	information	= DIA_Thorben_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Thorben_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Thorben_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thorben_PICKPOCKET (C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 900;
	condition	= DIA_Thorben_PICKPOCKET_Condition;
	information	= DIA_Thorben_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen (30, 28);
};
 
FUNC VOID DIA_Thorben_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thorben_PICKPOCKET);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_BACK 		,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};
	
func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
INSTANCE DIA_Thorben_angepisst(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_angepisst_Condition;
	information	= DIA_Thorben_angepisst_Info;
	permanent	= TRUE;
	important   = TRUE; 
};                       
FUNC INT DIA_Thorben_angepisst_Condition()
{	
	if (Npc_IsDead (Gritta))
	&& (Npc_IsInState (self, ZS_Talk))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_angepisst_Info()
{	
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //Du hast meine Gritta ermordet. Das werde ich dir nie verzeihen. Verschwinde, du Mörder!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		Hallo
// ************************************************************
INSTANCE DIA_Thorben_Hallo(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Hallo_Condition;
	information	= DIA_Thorben_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Thorben_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //Ah! Ein neues Gesicht! Bist wohl nicht aus Khorinis, was?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //Ist keine gute Zeit für Reisende. Überall Banditen, kaum Arbeit und jetzt lehnen sich auch noch die Bauern auf.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //Was verschlägt sich hierhin?
};

// ************************************************************
// 		Suche Arbeit			//E1
// ************************************************************
INSTANCE DIA_Thorben_Arbeit(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Arbeit_Condition;
	information	= DIA_Thorben_Arbeit_Info;
	permanent	= FALSE;
	description = "Ich bin auf der Suche nach Arbeit.";
};                       
FUNC INT DIA_Thorben_Arbeit_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Thorben_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_00"); //Ich bin auf der Suche nach Arbeit.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //Verstehst du denn was vom Tischlern?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //Das Einzige, was ich mit Holz machen kann, ist Feuer.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //Und wie sieht es mit Schlössern aus?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //Nun ja ...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //Tut mir Leid. Ich kann niemanden gebrauchen, der nichts von meinem Handwerk versteht.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //Und für einen Lehrling habe ich kein Geld.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "Thorben wird mich nicht als Lehrling aufnehmen.");
};

// ************************************************************
// 		Bei anderem Meister		(MIS Blessings)	//E2
// ************************************************************
INSTANCE DIA_Thorben_OtherMasters(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_OtherMasters_Condition;
	information	= DIA_Thorben_OtherMasters_Info;
	permanent	= FALSE;
	description = "Was ist, wenn ich bei einem der anderen Meister hier als Lehrling anfangen will?";
};                       
FUNC INT DIA_Thorben_OtherMasters_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_OtherMasters_Info()
{	
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //Was ist, wenn ich bei einem der anderen Meister hier als Lehrling anfangen will?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //Nun, ich will dir meine Zustimmung geben.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //Aber es wird das Beste sein, wenn du dir vorher den Segen der Götter geben lässt.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //Sag, bist du ein gläubiger Mann?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "Also, wenn du meinst ob ich regelmäßig bete... ", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Ja. Und zwar demütigst, Meister Torben.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Dann geh zu Vatras, dem Priester Adanos', und lass dir seinen Segen geben.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //Er wird dir sagen, wo du einen Priester Innos' finden kannst. Auch seinen Segen sollst du dir holen.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Wenn du den Segen der Götter bekommen hast, werde ich für dich stimmen.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben gibt mir seine Zustimmung, wenn ich mich von einem Priester Adanos und einem Priester Innos segnen lasse.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Ja. Und zwar demütigst, Meister Torben.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //Also, wenn du meinst, ob ich regelmäßig bete ...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //Ich verstehe!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //Ein Mann, der sein Handwerk nicht mit dem Segen der Götter verrichtet, wird niemals meine Zustimmung bekommen.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Bitte die Götter um Vergebung für deine Verfehlungen.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG		//E3  (PERM)
// ************************************************************
INSTANCE DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_ZUSTIMMUNG_Condition;
	information	= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent	= TRUE;
	description = "Wie steht es mit deiner Zustimmung, Meister?";
};                       
FUNC INT DIA_Thorben_ZUSTIMMUNG_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_ZUSTIMMUNG_Info()
{	
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //Wie steht es mit deiner Zustimmung, Meister?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //Hat dir Vatras seinen Segen gegeben?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Ja.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //Und hast du dir auch den Segen eines Priesters Innos' geholt?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Ja, das habe ich.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //Dann sollst du auch meinen Segen haben. Für welchen Weg du dich auch entscheiden magst, verrichte dein Handwerk gut, mein Junge!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Thorben gibt mir seine Zustimmung, wenn ich irgendwo als Lehrling anfangen will.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //Nein. Noch nicht ...
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //Du kennst meine Bedingung. Nur mit dem Segen der Götter sollst du dein Handwerk verrichten.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Noch nicht ...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //Dann weiß ich nicht, warum du mich noch einmal fragst. Du kennst meine Bedingung.
	};
};

// ************************************************************
// 		Was weißt du über Schlösser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "Du kennst dich mit Schlössern aus?";
};                       
FUNC INT DIA_Thorben_Locksmith_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Locksmith_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //Du kennst dich mit Schlössern aus?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //Was nützt eine gute Truhe ohne ein gutes Schloss?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //Ich fertige meine Schlösser selbst an. Dann kann ich wenigstens sicher sein, dass ich meine Truhen nicht umsonst so stabil gebaut habe.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //Ein schlechtes Schloss ist leicht zu knacken. Und Diebe gibt es in Khorinis genug. Vor allem in letzter Zeit!
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
INSTANCE DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Schuldenbuch_Condition;
	information	= DIA_Thorben_Schuldenbuch_Info;
	permanent	= FALSE;
	description = "Ich habe hier Lehmars Schuldenbuch ...";
};                       
FUNC INT DIA_Thorben_Schuldenbuch_Condition()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Schuldenbuch_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //Ich habe hier Lehmars Schuldenbuch ...
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //(mißtrauisch) Woher hast du es?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //Das sollte dich weniger interessieren als die Tatsache, dass dein Name drinsteht.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //Gib es mir!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //Was bekomme ich dafür?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //Ich habe kein Geld übrig und kann dir nichts geben, außer meinen Dank.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schlösser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "Kannst du mir beibringen, wie man Schlösser knackt?";
};                       
FUNC INT DIA_Thorben_PleaseTeach_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_PleaseTeach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //Kannst du mir beibringen, wie man Schlösser knackt?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //Ohne dich würde ich wahrscheinlich meinen Lebtag lang an Lehmar zahlen.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //Ich werde dir beibringen, was du wissen willst.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //Du hast mir die 100 Goldstücke gebracht. Das war sehr anständig von dir.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //Ich schäme mich fast dafür, aber ich muss noch mehr von dir verlangen.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //Wenn ich Lehmar nicht bald seine Schulden zurückzahlen kann, schickt er mir seine Schläger auf den Hals.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Gib mir noch 100 Goldstücke, und ich werde dich unterrichten.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Vielleicht später... ", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Gut. Hier sind 100 Goldstücke.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //Du hast Grittas Schulden bei Matteo bezahlt. Scheinst mir ein anständiger Kerl zu sein. Ich werde dir beibringen, was du wissen willst.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //Allerdings kann ich es nicht umsonst tun. Ich habe immer noch einen Haufen Schulden und brauche das Geld.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //Wie viel verlangst du?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 Goldstücke.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Vielleicht später... ", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Gut. Hier sind 200 Goldstücke.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Hmm ... Ich weiß nicht, ob man dir trauen kann oder nicht.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //Am Ende bist du noch einer dieser Rumtreiber, die nur in die Stadt kommen, um den ehrlichen Leuten ihre Truhen auszuräumen.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //Bevor ich mir nicht sicher bin, dass du ein anständiger Kerl bist, werde ich dir nichts beibringen.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Gut. Hier sind die 200 Goldstücke.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //Das Geld wird mir sehr helfen. Wir können anfangen, sobald du bereit bist.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //Für die 200 fehlen dir aber noch ein paar. Ich brauche das Geld.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Gut. Hier sind die 100 Goldstücke.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //Dann können wir anfangen, sobald du bereit bist.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //Für die 100 fehlen dir aber noch ein paar.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //Vielleicht später ...

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schlösser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("Bring mir bei, wie ich ein Schloß knacken kann!", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};                       
FUNC INT DIA_Thorben_Teach_Condition()
{	
	if (Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Teach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //Bring mir bei, wie ich ein Schloss knacken kann!
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //Du brauchst nur einen Dietrich. Wenn du ihn im Schloss vorsichtig nach rechts und links bewegst, kannst du den Mechanismus aufhebeln.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //Aber wenn du ihn zu stark oder zu schnell in die falsche Richtung bewegst, dann wird er dir abbrechen.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //Je geschickter du wirst, desto weniger Dietriche brauchst du. Das ist eigentlich schon alles.
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
INSTANCE DIA_Thorben_TRADE(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 3;
	condition	= DIA_Thorben_TRADE_Condition;
	information	= DIA_Thorben_TRADE_Info;
	permanent	= TRUE;
	description = "Kannst du mir Dietriche verkaufen?";
	trade		= TRUE;
};                       
FUNC INT DIA_Thorben_TRADE_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //Kannst du mir Dietriche verkaufen?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //Wenn ich noch welche habe ...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //Meinetwegen. Aber ohne dass du weißt, wie man damit umgeht, werden sie dir nichts nützen.
	};
	
	if (Npc_HasItems (self, ITke_Lockpick) == 0) 
	&& (Kapitel > Dietrichgeben) 
	{
		CreateInvItems (self, ITKE_LOCKPICK,5);
		Dietrichgeben = Dietrichgeben +1;
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Der Tischler Thorben verkauft Dietriche."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Thorben_MissingPeople_Condition;
	information	 = 	DIA_Addon_Thorben_MissingPeople_Info;

	description	 = 	"Hattest du schon mal einen Lehrling?";
};

func int DIA_Addon_Thorben_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Thorben_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //Hattest du schon mal einen Lehrling?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Ja. Das ist auch noch gar nicht so lange her.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //Und? Was ist passiert?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //Sein Name ist Elvrich. Er ist mein Neffe.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //Ich war eigentlich recht zufrieden mit ihm, doch eines Tages kam er einfach nicht mehr zur Arbeit.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich der Tischlerlehrling von Thorben ist verschwunden."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Hast du das der Miliz gemeldet?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Wie lange hast du ihn schon nicht mehr gesehen?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Wo ist Elvrich jetzt?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //Wie lange hast du ihn schon nicht mehr gesehen?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //Ich schätze, das ist jetzt etwa 2 Wochen her.
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //Wo ist Elvrich jetzt?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //Was weiß ich? Er hat sich ständig in dem schmierigen Bordell am Hafen herumgetrieben.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //Würde mich nicht wundern, wenn er da noch bei so einer Dirne im Bett liegt.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //Hast du das der Miliz gemeldet?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Ja, sicher. Sie sollten ihn wieder einfangen und dafür Sorgen, dass der Faulpelz seine Arbeit verrichtet. Aber das bereue ich auch schon wieder.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //Soll er doch machen, was er will. Früher oder später wird er einsehen, dass er ohne gescheite Arbeit in Khorinis nicht weit kommen wird.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //(zynisch) Was du nicht sagst.
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information	 = 	DIA_Addon_Thorben_ElvrichIsBack_Info;

	description	 = 	"Elvrich wird ab jetzt wieder für dich arbeiten.";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Elvrich wird ab jetzt wieder für dich arbeiten.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //Ich kann nur hoffen, dass er nicht beim nächsten Weiberrock, der vorbei segelt, wieder verschwunden ist.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Nimm dieses Gold von mir als Dank, dass du meinen Lehrling zu mir zurück gebracht hast.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine		//E1
// ************************************************************
INSTANCE DIA_Thorben_Paladine(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Paladine_Condition;
	information	= DIA_Thorben_Paladine_Info;
	permanent	= FALSE;
	description = "Was weißt du über die Paladine?";
};                       
FUNC INT DIA_Thorben_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Thorben_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Paladine_15_00"); //Was weißt du über die Paladine?
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //Nicht viel. Sie kamen vor zwei Wochen mit dem Schiff vom Festland an.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Seitdem haben sie sich ins obere Viertel zurückgezogen.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Keiner von uns weiß so genau, warum sie hier sind.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Viele haben Angst vor einem Angriff der Orks.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //Ich vermute aber, sie sind hier, um den Bauernaufstand niederzuschlagen.
};

// ************************************************************
// 		Bauernaufstand		//E2
// ************************************************************
INSTANCE DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Bauernaufstand_Condition;
	information	= DIA_Thorben_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Weißt du etwas über den Bauernaufstand?";
};                       
FUNC INT DIA_Thorben_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Bauernaufstand_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //Weißt du etwas über den Bauernaufstand?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //Nach allem, was man hört, hat sich Onar der Großbauer Söldner angeheuert, die ihm die Truppen des Königs vom Hals halten sollen.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //Er hat wohl keine Lust mehr, seine Ernte und sein Vieh den Paladinen und Milizen zum Fraß vorzuwerfen.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //Alles, was wir in der Stadt davon mitbekommen, ist, dass die Preise fürs Essen hoch gehen.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //Onars Hof liegt weit östlich von hier. Falls es zu Kämpfen kommen sollte, kriegen wir hier davon sowieso nichts mit.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //Wenn du mehr erfahren willst, frag die Händler am Marktplatz, die kommen mehr auf der Insel herum als ich.
};

// ************************************************************
// 		Gritta
// ************************************************************
INSTANCE DIA_Thorben_Gritta(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_Gritta_Condition;
	information	= DIA_Thorben_Gritta_Info;
	permanent	= FALSE;
	description = "Ich komme wegen Gritta ...";
};                       
FUNC INT DIA_Thorben_Gritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Gritta_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //Ich komme wegen Gritta ...
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //Meine Nichte? Was willst du von ihr? Es geht doch nicht etwa um Geld?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //Sie schuldet dem Händler Matteo 100 Goldstücke.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //Das darf doch nicht wahr sein. Seit dieses kleine Miststück bei mir wohnt, habe ich nichts als Ärger!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //Sie hat sich bei so gut wie allen Händlern der Stadt verschuldet.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //Ich musste bei Lehmar, dem Geldverleiher, 200 Goldstücke leihen, um ihre Schulden zu begleichen! Und jetzt das!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Gritta müsste im Haus sein.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //Nur zu, frag sie. Aber ich sag dir gleich. Sie hat nicht EIN Goldstück.
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output (other, self,"DIA_Thorben_Gritta_15_08"); //Wir werden sehen ...
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
INSTANCE DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_GrittaHatteGold_Condition;
	information	= DIA_Thorben_GrittaHatteGold_Info;
	permanent	= FALSE;
	description = "Deine Nichte hatte 100 Goldstücke bei sich.";
};                       
FUNC INT DIA_Thorben_GrittaHatteGold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_GrittaHatteGold_Info()
{	
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Deine Nichte hatte 100 Goldstücke bei sich.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //WAS?! Diese kleine Schlange - das war MEIN Gold! Sie hat es aus meiner Truhe genommen.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //Gib es mir zurück! Ich muss zuerst Lehmar bezahlen. Matteo kann sein Geld später bekommen!

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Ich habe Matteo sein Geld schon gegeben!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Nein. Matteo wird sein Geld von mir zurückbekommen.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Hier hast du dein Gold.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //So wie ich die kleine Schlange kenne, rennt sie zur Stadtwache und zeigt dich auch noch an!
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //Ich werde dafür sorgen, dass die Sache wieder ins Reine kommt!
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //Ich habe Matteo sein Gold schon gegeben!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //Verdammt! Na gut - Schulden sind Schulden. Immerhin hast du das Geld nicht behalten. Dafür muss ich dir wohl danken.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //Nein. Matteo wird sein Gold von mir zurückbekommen.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //Damit brockst du mir eine Menge Ärger ein. Lehmar ist nicht sehr nachsichtig, wenn es um Schulden geht.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //Aber immerhin willst du die Schulden meiner Nichte begleichen. Dafür muss ich dir wohl danken.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Hier hast du dein Gold.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //Danke! Damit habe ich zumindest schon mal einen Teil von dem, was ich Lehmar schulde!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //Nicht zu fassen, dass sie sich an meinem Gold vergriffen hat!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















