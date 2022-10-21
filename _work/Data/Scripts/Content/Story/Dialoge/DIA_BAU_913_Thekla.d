// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thekla_EXIT (C_INFO)
{
	npc         = BAU_913_Thekla;
	nr          = 999;
	condition   = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Thekla_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Thekla_HALLO		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 1;
	condition	= DIA_Thekla_HALLO_Condition;
	information	= DIA_Thekla_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Thekla_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Thekla_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Thekla_HALLO_17_00"); //Was machst du hier in meiner Küche?
};

// ************************************************************
// 			  				   Lecker
// ************************************************************
instance DIA_Thekla_Lecker		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 2;
	condition	= DIA_Thekla_Lecker_Condition;
	information	= DIA_Thekla_Lecker_Info;
	permanent 	= FALSE;
	description	= "Das riecht aber lecker hier!";
};

func int DIA_Thekla_Lecker_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Lecker_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //Das riecht aber lecker hier!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //Oh ja! Ich kenne Typen wie dich. Die rennen hier zuhauf rum.
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //Wollen sich erst einschmeicheln, und wenn man sie mal braucht, sind sie nirgendwo zu sehen!
};

// ************************************************************
// 			  				   Hunger
// ************************************************************
var int Thekla_GaveStew;
// ---------------------

instance DIA_Thekla_Hunger		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 3;
	condition	= DIA_Thekla_Hunger_Condition;
	information	= DIA_Thekla_Hunger_Info;
	permanent 	= FALSE;
	description	= "Ich habe Hunger!";
};

func int DIA_Thekla_Hunger_Condition ()
{
	if (Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Hunger_15_00"); //Ich habe Hunger!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_01"); //Ich verteile kein Essen an Landstreicher. Hier gibt's nur was für die Leute, die arbeiten.
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //(verächtlich) Und für das Söldnerpack natürlich.
	}
	else if (other.guild == GIL_SLD)
	|| 		(other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_03"); //Hier, friss!
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_04"); //Milizen werden hier nicht bedient.
	}
	else //Pal, Kdf oder Nov
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //Wie könnte ich einem Vertreter Innos' eine Bitte abschlagen.
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	};
};

// ************************************************************
// 			  				   Arbeit
// ************************************************************

instance DIA_Thekla_Arbeit		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_Arbeit_Condition;
	information	= DIA_Thekla_Arbeit_Info;
	permanent 	= FALSE;
	description	= "Ich suche Arbeit.";
};

func int DIA_Thekla_Arbeit_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Arbeit_15_00"); //Ich suche Arbeit...
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //Du willst hier auf dem Hof arbeiten?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //Das kann nur Onar entscheiden. Ihm gehört der Hof und das ganze Tal.
};

// ************************************************************
// 			  				   WannaJoin
// ************************************************************

instance DIA_Thekla_WannaJoin		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 5;
	condition	= DIA_Thekla_WannaJoin_Condition;
	information	= DIA_Thekla_WannaJoin_Info;
	permanent 	= FALSE;
	description	= "Ich wollte mich eigentlich den Söldnern anschließen...";
};

func int DIA_Thekla_WannaJoin_Condition ()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //Ich wollte mich eigentlich den Söldnern anschließen...
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //Du bist wohl auch einer von diesen Verbrechern aus der Strafkolonie?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //Hätte ich mir gleich denken können! Lass mich bloß in Ruhe! Hier gibt's schon genug Männer wie dich!
};

// ************************************************************
// 			  				   Schlafen
// ************************************************************

instance DIA_Thekla_Schlafen		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 6;
	condition	= DIA_Thekla_Schlafen_Condition;
	information	= DIA_Thekla_Schlafen_Info;
	permanent 	= FALSE;
	description	= "Ich brauche einen Platz zum Schlafen.";
};

func int DIA_Thekla_Schlafen_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Schlafen_15_00"); //Ich brauche einen Platz zum Schlafen.
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //Lass dir bloß nicht einfallen, in meiner Küche zu pennen. Such dir einen Platz in der Scheune.
};
		
// ************************************************************
// 			  				   Problem
// ************************************************************

instance DIA_Thekla_Problem		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Problem_Condition;
	information	= DIA_Thekla_Problem_Info;
	permanent 	= FALSE;
	description	= "Was hast du für ein Problem mit den Söldnern?";
};

func int DIA_Thekla_Problem_Condition ()
{
	if (kapitel <= 3)
	&& (Npc_KnowsInfo (other, DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Problem_15_00"); //Was hast du für ein Problem mit den Söldnern?
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //Ach, die Kerle gehen mir auf die Nerven! Vor allem Sylvio und sein fetter Freund Bullco.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //Die beiden sitzen jetzt schon Tage lang in ihrer Ecke und machen mir das Leben zur Hölle.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //Die Suppe ist zu heiß, das Fleisch ist zu zäh, und so weiter und so weiter.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //Warum unternimmst du nichts dagegen?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //Du Klugscheißer! Was soll ich denn machen? Mit dem Nudelholz draufhauen? Das kann ich bei den Bauern machen, aber diese miesen Kerle schlagen zurück.
	};
};

// ************************************************************
// 			  				   Manieren
// ************************************************************

instance DIA_Thekla_Manieren		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Manieren_Condition;
	information	= DIA_Thekla_Manieren_Info;
	permanent 	= FALSE;
	description	= "Soll ich den beiden Manieren beibringen?";
};

func int DIA_Thekla_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thekla_Problem)) 
	&& (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Manieren_15_00"); //Soll ich den beiden Manieren beibringen?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //Mach dich nicht unglücklich, Schätzchen. Soweit ich weiß, hat Sylvio hat eine magische Rüstung. Du kannst ihn nicht besiegen.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //Und was ist mit Bullco?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //Der Kerl ist stark wie ein Bär. Er hat bisher jeden umgehauen, der ihm oder Sylvio krumm gekommen ist.
};
		
// ************************************************************
// 			  				  After Fight
// ************************************************************

instance DIA_Thekla_AfterFight (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_AfterFight_Condition;
	information	= DIA_Thekla_AfterFight_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Thekla_AfterFight_Condition ()
{
	if (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info ()
{
	if (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //Du hast es Bullco aber ganz schön gezeigt, Schätzchen.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //War bestimmt anstrengend, das fette Schwein zu verprügeln.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //Du hast dich ja ganz schön verprügeln lassen, Schätzchen.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //Hab ich's dir nicht gesagt? Jetzt weißt du, was ich meine.
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //Freut mich, wenn du dich amüsierst.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //Jetzt zieh mal nicht so'n Gesicht. Du bist nicht der Erste, der von dem Abschaum verprügelt wurde.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //Hier, iss dir erst mal 'n Happen, damit du wieder zu Kräften kommst.
	B_GiveInvItems (self, other, ItFo_XPStew, 1);	
	Thekla_GaveStew = TRUE;
};

// ************************************************************
// 			  				 PaketSuccess 
// ************************************************************
instance DIA_Thekla_SagittaPaket (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_SagittaPaket_Condition;
	information	= DIA_Thekla_SagittaPaket_Info;
	permanent 	= TRUE;
	description	= "Hier ist das Päckchen von Sagitta.";
};

func int DIA_Thekla_SagittaPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_TheklasPaket))
	&& (MIS_Thekla_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info ()
{
	B_GiveInvItems (other, self, ItMi_TheklasPaket, 1);
	AI_Output (other, self, "DIA_Thekla_SagittaPaket_15_00"); //Hier ist das Päckchen von Sagitta.
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //Danke sehr. Bist ja doch zu etwas zu gebrauchen.
	MIS_Thekla_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_TheklasPaket);		
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;
// ------------------------

instance DIA_Thekla_PERM		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 900;
	condition	= DIA_Thekla_PERM_Condition;
	information	= DIA_Thekla_PERM_Info;
	permanent	= TRUE;
	description	= "Kann ich noch etwas von deinem Eintopf haben?";
};
func int DIA_Thekla_PERM_Condition()
{
	if (Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //Kann ich noch etwas von deinem Eintopf haben?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //Ich hab nichts mehr.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //Nicht mal mehr ein kleines Schüsselchen?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //Nein.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //Kann ich den Topf auslecken?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //Jetzt hör aber auf!
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //Wenn du so wild bist auf den Eintopf, dann musst du auch was dafür tun.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //Was?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //Geh zu Sagitta, der Heilerin hinter Sekobs Hof, und bring mir ein Päckchen mit Kräutern von ihr.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //Wenn du mir die Kräuter bringst, mach ich dir deinen Eintopf.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"Wenn ich Thekla die Kräuter von der Heilerin Sagitta bringe, kocht sie mir noch einen Eintopf. Sagitta lebt hinter Sekob's Hof.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //Na schön. Dann will ich mal nicht so sein. Hier. Sonst fällst du mir noch vom Fleisch.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //Na, na, na, wer wird denn so gierig sein! Ich sag dir Bescheid, wenn ich mal wieder was für dich zu tun hab.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //DANN gibt's auch wieder Eintopf, klar?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //Ich hab gehört, du hast Bennet geholfen, aus dem Gefängnis zu entkommen. Reife Leistung, Kleiner.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //Diese Mistkerle von der Miliz haben Bennet ins Gefängnis gesteckt.
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //Tu mir einen Gefallen und hol ihn da wieder raus, ja? Ich mach dir in der Zwischenzeit einen leckeren Eintopf.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //Ich hab nichts mehr. Komm später noch mal wieder.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //Du bist auch immer hungrig, was? Was machst du eigentlich die ganze Zeit?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //Ich hab ein paar Drachen erledigt.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //Oh! Na dann wird's wohl mal wieder Zeit für einen ordentlichen Eintopf.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //Das war's. Kein Eintopf mehr da.
			};
		};
	}
	else //Running oder Failed
	{
		AI_Output (self, other, "DIA_Thekla_PERM_17_21"); //Ohne die Kräuter kein Eintopf - klar?
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thekla_PICKPOCKET (C_INFO)
{
	npc			= BAU_913_Thekla;
	nr			= 900;
	condition	= DIA_Thekla_PICKPOCKET_Condition;
	information	= DIA_Thekla_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Thekla_PICKPOCKET_Condition()
{
	C_Beklauen (53, 60);
};
 
FUNC VOID DIA_Thekla_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thekla_PICKPOCKET);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_BACK 		,DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};
	
func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};























