///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fernando_EXIT   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 999;
	condition   = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fernando_PICKPOCKET (C_INFO)
{
	npc			= VLK_405_Fernando;
	nr			= 900;
	condition	= DIA_Fernando_PICKPOCKET_Condition;
	information	= DIA_Fernando_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre gewagt seinen Geldbeutel zu stehlen)";
};                       

FUNC INT DIA_Fernando_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff))
	&& (NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fernando_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fernando_PICKPOCKET);
	Info_AddChoice		(DIA_Fernando_PICKPOCKET, DIALOG_BACK 		,DIA_Fernando_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fernando_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fernando_PICKPOCKET_DoIt);
};

func void DIA_Fernando_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 50)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Fernando_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		B_NpcClearObsessionByDMT (self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Fernando_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fernando_PICKPOCKET);
};
//*********************************************************************
//	Info Na.
//*********************************************************************

INSTANCE DIA_Fernando_Hello   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 5;
	condition   = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent   = FALSE;
	description = "Wie laufen die Geschäfte?";
};

FUNC INT DIA_Fernando_Hello_Condition()
{
	if (NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Fernando_Hello_Info()
{
	AI_Output (other,self ,"DIA_Fernando_Hello_15_00"); //Wie laufen die Geschäfte?
	AI_Output (self ,other,"DIA_Fernando_Hello_14_01"); //Nicht gut. Früher, als die Barriere noch stand, da waren die Zeiten besser.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_02"); //Die Gefangenen haben das Erz kistenweise aus den Minen geschürft und meine Schiffe haben es zum Festland transportiert.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_03"); //Und auf dem Rückweg haben sie Nahrung und andere Waren mitgebracht
	AI_Output (self ,other,"DIA_Fernando_Hello_14_04"); //Aber jetzt, da wir vom Festland abgeschnitten sind, sind wir auf die Versorgung durch die Bauern angewiesen.
};
//*********************************************************************
//	Info Perm
//*********************************************************************

INSTANCE DIA_Fernando_Perm   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 850;
	condition   = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent   = TRUE;
	description = "Womit verdienst du jetzt dein Gold? ";
};

FUNC INT DIA_Fernando_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Fernando_Hello))
	&& (NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Fernando_Perm_Info()
{
	AI_Output (other,self ,"DIA_Fernando_Perm_15_00"); //Womit verdienst du jetzt dein Gold?

	if (Fernando_ImKnast == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else
	{
		if (Fernando_HatsZugegeben == TRUE)
		{
			AI_Output (self ,other,"DIA_Addon_Fernando_Perm_14_00"); //Ich weiß es nicht. Auf jeden Fall lass ich mich auf keine krummen Geschäfte mehr ein. So viel ist sicher.
		}	
		else if (Npc_KnowsInfo (other,DIA_Fernando_Success) == FALSE)
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_01"); //Momentan lebe ich von meinen Ersparnissen. Aber wenn es mir nicht gelingt, wieder ins Geschäft zu kommen, werden harte Zeiten auf mich zukommen.
		}
		else
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_02"); //Ich bin ruiniert. Hätte ich nur auf meinen Vater gehört und wäre nie in das Erzgeschäft eingestiegen.
		};
	};
};
//*********************************************************************
//	Info Minental
//*********************************************************************
INSTANCE DIA_Fernando_Minental   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 2;
	condition   = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Fernando_Minental_Condition()
{
	if (NpcObsessedByDMT_Fernando == FALSE)
	&& (MIS_OLDWORLD == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (EnterOW_Kapitel2 == FALSE)
	&& (Fernando_HatsZugegeben == FALSE)//ADDON
	&& (Fernando_ImKnast == FALSE) //HACK ADDON PATCH
	{
		return TRUE;
	};
};

FUNC VOID DIA_Fernando_Minental_Info()
{
	AI_Output (self ,other,"DIA_Fernando_Minental_14_00"); //Hey du - warte mal. Du willst dich doch auf den Weg ins Minental machen, richtig?
	AI_Output (other ,self,"DIA_Fernando_Minental_15_01"); //Und?
	AI_Output (self ,other,"DIA_Fernando_Minental_14_02"); //Ich schlage dir ein Geschäft vor. Du berichtest mir, wie es dort um das Erz steht und ich besorge dir dafür ...
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_03"); //... einen Runenstein.
	}
	else
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_04"); //... einen Ring, der deine Lebenskraft stärkt.
	};
	AI_Output (other ,self,"DIA_Fernando_Minental_15_05"); //Ich werde sehen, was sich machen lässt.
	
	B_NpcClearObsessionByDMT (self);
	Npc_ExchangeRoutine (self, "START");
	
	Log_CreateTopic (TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Fernando,LOG_RUNNING);
	B_LogEntry (TOPIC_Fernando,"Der Händler Fernando will wissen, wie es um das Erz im Minental steht.");
};

///////////////////////////////////////////////////////////////////////
//	Info BanditTrader
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fernando_BanditTrader		(C_INFO)
{
	npc		 = 	VLK_405_Fernando;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Fernando_BanditTrader_Condition;
	information	 = 	DIA_Addon_Fernando_BanditTrader_Info;

	description	 = 	"Du hast Waffen an die Banditen gekauft.";
};

func int DIA_Addon_Fernando_BanditTrader_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Fernando_Hello))
	&& (NpcObsessedByDMT_Fernando == FALSE)
	&& 	(
		(Npc_HasItems (other,ItMw_Addon_BanditTrader))
		||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
		||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Fernando_BanditTrader_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_00"); //Du hast Waffen an die Banditen verkauft.
	AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_01"); //(verdutzt) Aber. Wie kommst du denn auf SOWAS?

	B_LogEntry (TOPIC_Addon_BanditTrader,"Fernando, der Überseehändler, hat selbst zugegeben, Waffen an die Banditen geliefert zu haben."); 

	B_GivePlayerXP (XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;

	if	((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_02"); //Diese Liste mit Waren, die ich einem Banditen abgenommen habe, trägt deine Unterschrift.
	};
	
	if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_03"); //Der Ring hier der Übersee-Händlergilde Araxos habe ich bei den Banditen gefunden und du bist ein Überseehändler.

		if	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
		{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_04"); //Und die Schwerter, die die Banditen bei sich hatten, tragen deine Initialen.
		};
	}
	else //nur (Npc_HasItems (other,ItMw_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_05"); //Die Schwerter, die die Banditen bei sich hatten, tragen deine Initialen.
	};

	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_06"); //Du kannst es ruhig zugeben. Ich habe dich enttarnt.

	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_07"); //DU warst das also. DU hast mich verraten. Das werde ich dir heimzahlen.
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_08"); //Dazu müsstest du hier erst mal raus kommen, aber ich glaube kaum, dass sie dich so bald wieder gehen lassen.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_09"); //(verärgert, zu sich selbst) Meine Zeit wird noch kommen.
		B_NpcClearObsessionByDMT (self);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_10"); //(flehend) Ich wollte das gar nicht, das musst du mir glauben.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_11"); //(flehend) Am Anfang war es nur Proviant, was sie von mir wollten. Meine Geschäfte liefen nicht so gut, da habe ich mich darauf eingelassen.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_12"); //(flehend) Später dann wurden sie immer aufdringlicher und drohten, mich umzubringen, wenn ich ihnen nicht die Schwerter liefern würde, die sie haben wollten.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_13"); //(flehend) Du kannst mich nicht dafür verurteilen. Ich bin ein Opfer der Umstände.
		
		if (Fernando_ImKnast == FALSE)//Joly:zur Sicherheit
		{
			Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Was zahlst du, wenn ich dich laufen lasse.", DIA_Addon_Fernando_BanditTrader_preis );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Die Miliz wird sich mit dir befassen.", DIA_Addon_Fernando_BanditTrader_mil );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Mir kommen die Tränen.", DIA_Addon_Fernando_BanditTrader_Uptown );
		};
	};
};
func void DIA_Addon_Fernando_BanditTrader_Uptown ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_00"); //Mir kommen die Tränen. Aber für jemanden, der im oberen Viertel lebt, bist du ziemlich widerwärtig.
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_01"); //Für ein paar Goldstücke verkaufst du deine Seele.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_Uptown_14_02"); //Ich habe meine Kosten zu decken. Wenn ich nicht flüssig bin, werfen sie mich dem Mob aus dem Hafenviertel zum Fraß vor.
};
func void DIA_Addon_Fernando_BanditTrader_mil ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_00"); //Die Miliz wird sich mit dir befassen.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_01"); //Das kannst du nicht machen.
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_02"); //Na, dann pass mal auf, wie ich das kann.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_03"); //Bei Innos. Ich bin ruiniert.
	B_NpcClearObsessionByDMT (self);
};
func void DIA_Addon_Fernando_BanditTrader_preis ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_preis_15_00"); //Was zahlst du, wenn ich dich laufen lasse?
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_01"); //Du weißt doch, wie es um mich bestellt ist. Ich kann dir nicht viel geben.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_02"); //Ich geb dir 200 Goldmünzen und einen wertvollen Ring.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_03"); //Das muss dir reichen. Krieg ich jetzt das belastende Material von dir?

	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Vergiss es. Das geb' ich nicht aus der Hand", DIA_Addon_Fernando_BanditTrader_nein );
	Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Von mir aus. Abgemacht.", DIA_Addon_Fernando_BanditTrader_ja );
};
func void DIA_Addon_Fernando_BanditTrader_ja ()
{ 
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_ja_15_00"); //Von mir aus. Abgemacht.
	B_GivePlayerXP (XP_Ambient);
	Npc_RemoveInvItems	(hero ,ItMw_Addon_BanditTrader, Npc_HasItems (other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem	(hero ,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem	(hero ,ItWr_Addon_BanditTrader);

	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_01"); //Gut, hier hast du das Gold.

	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);		
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_02"); //Und den Ring. Damit sind wir quitt.
	CreateInvItems (self, ItRi_Prot_Point_01, 1);									
	B_GiveInvItems (self, other, ItRi_Prot_Point_01, 1);		
	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
};
func void DIA_Addon_Fernando_BanditTrader_nein ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_nein_15_00"); //Nein. Das geb' ich nicht aus der Hand
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_nein_14_01"); //Na schön. Dann behalt es, aber wehe, du verrätst mich.
	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
};
//*********************************************************************
//	Info Success
//*********************************************************************
INSTANCE DIA_Fernando_Success   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 5;
	condition   = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent   = FALSE;
	description	= "Ich war im Minental.";
};
FUNC INT DIA_Fernando_Success_Condition()
{
	if (NpcObsessedByDMT_Fernando == FALSE)
	&& (Kapitel >= 3)
	&& (Npc_KnowsInfo (other, DIA_Fernando_Minental))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Fernando_Success_Info()
{
	AI_Output (other ,self,"DIA_Fernando_Success_15_00"); //Ich war im Minental.
	
	if (Fernando_ImKnast == FALSE)
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP (XP_Ambient);
		
		AI_Output (self ,other,"DIA_Fernando_Success_14_01"); //Und? Wie ist die Situation dort?
		AI_Output (other ,self,"DIA_Fernando_Success_15_02"); //Die Minen sind alle erschöpft, es gibt kaum mehr als ein paar Kisten voll Erz. Da lohnt sich der Abbau nicht mehr.
		AI_Output (self ,other,"DIA_Fernando_Success_14_03"); //Das darf nicht wahr sein. Dann bin ich ruiniert ...
	
		if (Fernando_HatsZugegeben == FALSE)
		{
			AI_Output (other ,self,"DIA_Fernando_Success_15_04"); //Wie sieht's mit unserem Geschäft aus?
			AI_Output (self ,other,"DIA_Fernando_Success_14_05"); //Nun, was deine Belohnung angeht ...
			
			if (other.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_06"); //Hier, nimm diesen Runenstein.
				B_GiveInvItems (self,other, ItmI_RuneBlank,1);
			}
			else
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_07"); //Hier ist der Ring.
				B_GiveInvItems (self,other, ItRi_Hp_02,1);
			};
		};
	}
	else 
	{
		B_Say (self, other, "$NOTNOW");
		Log_SetTopicStatus (TOPIC_Fernando, LOG_OBSOLETE);
		B_LogEntry (TOPIC_Fernando,"Fernando will die Infos nicht mehr. Und ich werde auch den Lohn nicht mehr kriegen.");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Fernando_Obsession		(C_INFO)
{
	npc		 = 	VLK_405_Fernando;
	nr		 = 	30;
	condition	 = 	DIA_Fernando_Obsession_Condition;
	information	 = 	DIA_Fernando_Obsession_Info;

	description	 = 	"Geht´s dir gut?";
};

func int DIA_Fernando_Obsession_Condition ()
{
	if (Kapitel >= 3)
	&& (NpcObsessedByDMT_Fernando == FALSE)
	&& (hero.guild == GIL_KDF)
		{
				return TRUE;
		};
};

func void DIA_Fernando_Obsession_Info ()
{
	B_NpcObsessedByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Fernando_Heilung		(C_INFO)
{
	npc		 = 	VLK_405_Fernando;
	nr		 = 	55;
	condition	 = 	DIA_Fernando_Heilung_Condition;
	information	 = 	DIA_Fernando_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Du bist besessen.";
};

func int DIA_Fernando_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	 {
				return TRUE;
	 };
};

func void DIA_Fernando_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Fernando_Heilung_15_00"); //Du bist besessen.
	AI_Output			(self, other, "DIA_Fernando_Heilung_14_01"); //Geh weg. Jetzt geh doch schon.
	B_NpcClearObsessionByDMT (self);
};







