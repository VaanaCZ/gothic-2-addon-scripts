///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Orlan_EXIT   (C_INFO)
{
	npc         = BAU_970_Orlan;
	nr          = 999;
	condition   = DIA_Orlan_EXIT_Condition;
	information = DIA_Orlan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Orlan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wein
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_Wein		(C_INFO)
{
	npc			 = 	BAU_970_Orlan;
	nr			 = 	3;
	condition	 = 	DIA_Orlan_Wein_Condition;
	information	 = 	DIA_Orlan_Wein_Info;
	permanent 	 =  FALSE;
	description	 = 	"Ich bringe den Wein aus dem Kloster.";
};
func int DIA_Orlan_Wein_Condition ()
{	
	if (MIS_GoraxWein == LOG_RUNNING)
	&& (Npc_HasItems (other, ItFo_Wine) >= 12)
	{
		return TRUE;
	};
};
func void DIA_Orlan_Wein_Info ()
{
	AI_Output (other, self, "DIA_Orlan_Wein_15_00"); //Ich bringe den Wein aus dem Kloster.
	AI_Output (self, other, "DIA_Orlan_Wein_05_01"); //Ausgezeichnet. Darauf habe ich schon gewartet.
	AI_Output (self, other, "DIA_Orlan_Wein_05_02"); //Ich habe mit Meister Gorax den Preis schon ausgemacht. Ich gebe dir die 100 Goldmünzen direkt mit.
	
	Info_ClearChoices (DIA_Orlan_Wein);
	
	Info_AddChoice (DIA_Orlan_Wein,"Okay, gib mir das Gold.",DIA_Orlan_Wein_JA);
	Info_AddChoice (DIA_Orlan_Wein,"Willst du mich verarschen? ",DIA_Orlan_Wein_NEIN);
};
FUNC VOID DIA_Orlan_Wein_JA()
{
	AI_Output (other, self, "DIA_Orlan_Wein_JA_15_00"); //Okay, gib mir das Gold.
	AI_Output (self, other, "DIA_Orlan_Wein_JA_05_01"); //Hier bitte. Es war mir eine Freude, mit dir Geschäfte zu machen.
	
	B_GiveInvItems (self, other, ItmI_Gold, 100);
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_NEIN()
{
	AI_Output (other, self, "DIA_Orlan_Wein_NEIN_15_00"); //Willst du mich verarschen? Der Preis sind 240 Goldmünzen.
	AI_Output (self, other, "DIA_Orlan_Wein_NEIN_05_01"); //So, Gorax hat dich wohl vorgewarnt, was? Gut, vielleicht kommen wir zwei ja ins Geschäft. Pass auf - ich gebe dir 100 Goldmünzen für den Wein.
	AI_Output (self, other, "DIA_Orlan_Wein_NEIN_05_02"); //Du erzählst Gorax, dass ich dich über den Tisch gezogen habe und bekommst von mir VIER Spruchrollen.
	
	Info_ClearChoices (DIA_Orlan_Wein);
	Info_AddChoice (DIA_Orlan_Wein,"Hey, gib mir einfach die 240 Goldmünzen.",DIA_Orlan_Wein_Nie);
	Info_AddChoice (DIA_Orlan_Wein,"Okay, klingt gut. Gib mir die Spruchrollen.",DIA_Orlan_Wein_Okay);
	Info_AddChoice (DIA_Orlan_Wein,"Was sind das für Spruchrollen? ",DIA_Orlan_Wein_Was);
};
FUNC VOID DIA_Orlan_Wein_Nie()
{
	AI_Output (other, self, "DIA_Orlan_Wein_Nie_15_00"); //Hey, gib mir einfach die 240 Goldmünzen.
	AI_Output (self, other, "DIA_Orlan_Wein_Nie_05_01"); //Du willst kein Geschäft machen, was? -seufz- Na gut, hier ist das Gold.
	
	B_GiveInvItems (self, other, ItmI_Gold, 240);
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_Okay()
{
	var string Text;
		
	Text = ConcatStrings( "4" , PRINT_ItemsErhalten);		
	PrintScreen	(Text, -1, -1, FONT_ScreenSmall, 2);
	
	B_GiveInvItems (self, other, ItmI_Gold, 100);
	
	AI_Output (other, self, "DIA_Orlan_Wein_Okay_15_00"); //Okay, klingt gut. Gib mir die Spruchrollen.
	AI_Output (self, other, "DIA_Orlan_Wein_Okay_05_01"); //Hier sind die Spruchrollen und das Gold.
	
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	
	CreateInvItems  (hero,ITSC_Light,2);
	CreateInvItems  (hero,ItSc_LightHeal,1);
	CreateInvItems  (hero,ItSc_SumGobSkel,1);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_Was()
{
	AI_Output (other, self, "DIA_Orlan_Wein_Was_15_00"); //Was sind das für Spruchrollen?
	AI_Output (self, other, "DIA_Orlan_Wein_Was_05_01"); //Keine Ahnung - ich kenne mich nicht damit aus. Die sind von einem Gast, der ... äh ... hat sie hier vergessen, ja.
};
///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_WERBISTDU		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	2;
	condition	 = 	DIA_Orlan_WERBISTDU_Condition;
	information	 = 	DIA_Orlan_WERBISTDU_Info;

	description	 = 	"Wer bist du?";
};

func int DIA_Orlan_WERBISTDU_Condition ()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_WERBISTDU_15_00"); //Wer bist du?
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_01"); //Ich bin Orlan, der Wirt dieser bescheidenen Schänke.
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_02"); //Was suchst du, Fremder? Vielleicht ein ordentliches Schwert oder einen guten Harnisch.
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_03"); //Einen guten Schluck aus den ländlichen Brennereien oder nur eine Information.
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_04"); //Das kann ich dir alles geben und noch mehr, wenn deine Münze rollt.

};

///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Greg		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Orlan_Greg_Condition;
	information	 = 	DIA_Addon_Orlan_Greg_Info;

	description	 = 	"Kennst du den Typ mit der Augenklappe?";
};

func int DIA_Addon_Orlan_Greg_Condition ()
{
	if (SC_SawGregInTaverne == TRUE)
	&& (Kapitel <= 3)
	&& (Npc_KnowsInfo (other, DIA_Orlan_WERBISTDU))
		{
			return TRUE;
		};
};

func void DIA_Addon_Orlan_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Orlan_Greg_15_00"); //Kennst du den Typ mit der Augenklappe?
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_01"); //Ich hab ihn hier schon mal gesehen. Ein übler Bursche.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_02"); //Er hat sich damals mit einer riesigen Kiste in einem meiner Zimmer oben einquartiert.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_03"); //Die Miete für das Zimmer hat er nur bezahlt, wenn man ihn ständig danach gefragt hat. Und selbst dann hat er sich damit noch Zeit gelassen.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_04"); //Dann war er eines Tages einfach verschwunden. Seine Kiste auch. Ich will mit solchen Kerlen nichts zu schaffen haben.
};

///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Ranger		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Orlan_Ranger_Condition;
	information	 = 	DIA_Addon_Orlan_Ranger_Info;

	description	 = 	"Bilde ich mir das nur ein oder starrst du meinen Ring an?";
};
func int DIA_Addon_Orlan_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Orlan_WERBISTDU))
	&& (SCIsWearingRangerRing == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Orlan_Ranger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_15_00"); //Bilde ich mir das nur ein oder starrst du meinen Ring an?
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_05_01"); //Ich bin mir nicht sicher, was ich davon halten soll.

	Orlan_KnowsSCAsRanger = TRUE;

	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);
	Info_AddChoice	(DIA_Addon_Orlan_Ranger, "Mann! Ich gehöre zum 'Ring des Wassers'!", DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice	(DIA_Addon_Orlan_Ranger, "Es ist ein Aquamarin. Schonmal einen gesehen?", DIA_Addon_Orlan_Ranger_Aqua);
};
func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_Aqua_15_00"); //Es ist ein Aquamarin. Schon mal einen gesehen?
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_01"); //Ja, das habe ich. Willkommen im Hauptquartier, Bruder des Rings.
	if (Npc_KnowsInfo (other, DIA_Addon_Orlan_NoMeeting)) //verrissen
	{
		AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_02"); //... auch wenn du mir nicht der Hellste zu sein scheinst ...
	};
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_03"); //Was kann ich für dich tun?
	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP (XP_Ambient);
};
func void DIA_Addon_Orlan_Ranger_Idiot ()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_Lares_15_00"); //Mann! Ich gehöre zum 'Ring des Wassers'!
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Lares_05_01"); //So so. Da haben sie sich aber ein ganz schönen Idioten ausgesucht ...
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Lares_05_02"); //Was willst du?
	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);	
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Teleportstein		(C_INFO)
{
	npc		 	= BAU_970_Orlan;
	nr		 	= 2;
	condition	= DIA_Addon_Orlan_Teleportstein_Condition;
	information	= DIA_Addon_Orlan_Teleportstein_Info;

	description	= "Hast du schon mal einen Teleportstein benutzt?";
};

func int DIA_Addon_Orlan_Teleportstein_Condition ()
{
	if (Orlan_KnowsSCAsRanger == TRUE)
	&& (SCUsed_TELEPORTER == TRUE)			//SC hat schon mal einen Teleporter benutzt
		{
			return TRUE;
		};
};

func void DIA_Addon_Orlan_Teleportstein_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Orlan_Teleportstein_15_00"); //Hast du schon mal einen Teleporterstein benutzt?
	AI_Output	(self, other, "DIA_Addon_Orlan_Teleportstein_05_01"); //Bist du wahnsinnig? Solange mir kein Wassermagier sagt, dass sie ungefährlich sind, werde ich mich ihnen keine 10 Fuss nähern.
	AI_Output	(self, other, "DIA_Addon_Orlan_Teleportstein_05_02"); //Sie haben mich damit beauftragt, einen dieser Teleportersteine zu verstecken und das ist auch schon alles, was damit zu tun haben will.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice	(DIA_Addon_Orlan_Teleportstein, "Kann ich diesen Teleportstein mal sehen?", DIA_Addon_Orlan_Teleportstein_sehen );
	Info_AddChoice	(DIA_Addon_Orlan_Teleportstein, "Wo ist dieser Teleportstein?", DIA_Addon_Orlan_Teleportstein_wo );
};
func void DIA_Addon_Orlan_Teleportstein_sehen ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_Teleportstein_sehen_15_00"); //Kann ich diesen Teleporterstein mal sehen?
	AI_Output			(self, other, "DIA_Addon_Orlan_Teleportstein_sehen_05_01"); //Von mir aus. Hier hast du den Schlüssel. Ich hab den Eingang verbarrikadiert.
	CreateInvItems (self, ITKE_ORLAN_TELEPORTSTATION, 1);									
	B_GiveInvItems (self, other, ITKE_ORLAN_TELEPORTSTATION, 1);
	
	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Orlan hat einen Teleportstein in einer Höhle südwestlich seiner Taverne eingeschlossen."); 
};

func void DIA_Addon_Orlan_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_Teleportstein_wo_15_00"); //Wo ist dieser Teleporterstein?
	AI_Output			(self, other, "DIA_Addon_Orlan_Teleportstein_wo_05_01"); //Im Süden, nicht weit von meiner Taverne entfernt, ist eine Höhle. Da haben die Wassermagier einen dieser Dinger gefunden.
};

///////////////////////////////////////////////////////////////////////
//	Info Meeting OHNE RING
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_NoMeeting (C_INFO)
{
	npc		 	= BAU_970_Orlan;
	nr		 	= 2;
	condition	= DIA_Addon_Orlan_NoMeeting_Condition;
	information	= DIA_Addon_Orlan_NoMeeting_Info;

	description	= "Ich soll hier im Ring des Wassers aufgenommen werden!";
};
func int DIA_Addon_Orlan_NoMeeting_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Orlan_WERBISTDU))
	&& (!Npc_KnowsInfo (other, DIA_Addon_Orlan_Ranger))
	&& (SCIsWearingRangerRing == FALSE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Orlan_NoMeeting_Info ()
{
	AI_Output (other, self, "DIA_Addon_Orlan_NoMeeting_15_00"); //Ich soll hier im Ring des Wassers aufgenommen werden!
	AI_Output (self, other, "DIA_Addon_Orlan_NoMeeting_05_01"); //(barsch) Ich sehe hier keinen Ring. Willst du was trinken?
};

///////////////////////////////////////////////////////////////////////
//	Info WhenRangerMeeting
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_WhenRangerMeeting		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Orlan_WhenRangerMeeting_Condition;
	information	 = 	DIA_Addon_Orlan_WhenRangerMeeting_Info;

	description	 = 	"Ich hörte von einem Treffen des 'Rings' in deiner Taverne.";
};

func int DIA_Addon_Orlan_WhenRangerMeeting_Condition ()
{
	if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
 	&& (Npc_KnowsInfo (other, DIA_Addon_Orlan_Ranger))
 	{
		return TRUE;
 	};
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_15_00"); //Ich hörte von einem Treffen des 'Rings' in deiner Taverne.
	AI_Output	(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_05_01"); //Das ist richtig. Das müsste eigentlich schon so weit sein.
	AI_Output	(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_05_02"); //Ich frag mich, wo die Jungs bleiben?

	B_GivePlayerXP (XP_Ambient);
	B_Addon_Orlan_RangersReadyForcoming ();
	self.flags = 0;

	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "Sie werden schon noch kommen.", DIA_Addon_Orlan_WhenRangerMeeting_theyCome );
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "Das Treffen ist heute?", DIA_Addon_Orlan_WhenRangerMeeting_Today );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_Today ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00"); //Das Treffen ist heute?
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01"); //Soweit ich mich erinnern kann, ja.
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02"); //Hoffentlich wird es nicht wieder so spät.
	B_MakeRangerReadyForMeetingALL ();
	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "(weiter)", DIA_Addon_Orlan_WhenRangerMeeting_Los );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00"); //Sie werden schon noch kommen.
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01"); //Wir werden ja sehen.
	B_MakeRangerReadyForMeetingALL ();
	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "(weiter)", DIA_Addon_Orlan_WhenRangerMeeting_Los );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_Los ()
{
	AI_StopProcessInfos (self);
	B_Addon_Orlan_ComingRanger ();
};

//-----------------------------------------------------
// BESSERE RÜSTUNG
//-----------------------------------------------------

instance DIA_Orlan_RUESTUNG		(C_INFO)
{
	npc		= 	BAU_970_Orlan;
	nr		= 	5;
	condition	 = 	DIA_Orlan_RUESTUNG_Condition;
	information	 = 	DIA_Orlan_RUESTUNG_Info;
	permanent	 = 	TRUE;

	description	 = 	"Welche Rüstung kannst du mir anbieten?";
};

var int DIA_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
		&& (DIA_Orlan_RUESTUNG_noPerm == FALSE)
		&& (hero.guild == GIL_NONE)
		)
		{
				return TRUE;
		};
};

func void DIA_Orlan_RUESTUNG_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_RUESTUNG_15_00"); //Welche Rüstung kannst du mir anbieten?
	AI_Output			(self, other, "DIA_Orlan_RUESTUNG_05_01"); //Ich habe hier ein sehr schönes Stück, das dir sicher gefallen wird.

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);

	Info_AddChoice			(DIA_Orlan_RUESTUNG, DIALOG_BACK	,	DIA_Orlan_RUESTUNG_BACK);	
	Info_AddChoice			(DIA_Orlan_RUESTUNG, "Lederrüstung. Schutz: Waffen 25, Pfeile 20, Feuer 5 (250 Gold)" , DIA_Orlan_RUESTUNG_Buy);	
};  

func void DIA_Orlan_RUESTUNG_Buy ()
{
	AI_Output				(other, self,"DIA_Orlan_RUESTUNG_Buy_15_00"); //Ich möchte die Lederrüstung kaufen.

	if (B_GiveInvItems		(other, self, ItMi_Gold, VALUE_ITAR_Leather_L))
		{
			AI_Output			(self, other,"DIA_Orlan_RUESTUNG_Buy_05_01"); //Eine gute Entscheidung.

			CreateInvItems 		(self, ItAr_Leather_L, 1);
			B_GiveInvItems		(self, other, ItAr_Leather_L, 1);
			AI_EquipBestArmor	(other);
			DIA_Orlan_RUESTUNG_noPerm = TRUE;
		}
	else
		{
			AI_Output			(self, other,"DIA_Orlan_RUESTUNG_Buy_05_02"); //Tut mir Leid. Erst wenn du das entsprechende Kleingeld hast, kommen wir ins Geschäft.
		};

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK ()
{
	AI_Output				(other, self,"DIA_Orlan_RUESTUNG_BACK_15_00"); //Ich denke darüber nach.
	AI_Output				(self, other,"DIA_Orlan_RUESTUNG_BACK_05_01"); //Wie du meinst. Aber warte damit nicht zu lange.

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_TRADE		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	70;
	condition	 = 	DIA_Orlan_TRADE_Condition;
	information	 = 	DIA_Orlan_TRADE_Info;
	trade		 = 	TRUE;
	permanent	 = 	TRUE;

	description	 = 	"Zeig mir deine Ware.";
};

func int DIA_Orlan_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
		{
				return TRUE;
		};
};

func void DIA_Orlan_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_TRADE_15_00"); //Zeig mir deine Ware.
	B_GiveTradeInv (self);
	
		//ADDON>
		if ((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE)||(SCIsWearingRangerRing == TRUE))
			{
				AI_Output			(self, other, "DIA_Addon_Orlan_TRADE_05_00"); //Klar, Bruder des Rings.
				Orlan_KnowsSCAsRanger = TRUE;
			}
		//ADDON<
		else if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_01"); //Natürlich. Es ist mir eine Ehre, solch hohen Besuch zu bewirten.
			}
		else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_02"); //Selbstverständlich, mein Herr.
			}
		else
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_03"); //Wenn du bezahlen kannst.
			};
};


///////////////////////////////////////////////////////////////////////
//	Info HotelZimmer
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_HotelZimmer		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	6;
	condition	 = 	DIA_Orlan_HotelZimmer_Condition;
	information	 = 	DIA_Orlan_HotelZimmer_Info;
	permanent	 = 	TRUE;

	description	 = 	"Was kostet ein Zimmer bei dir?";
};
var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;
func int DIA_Orlan_HotelZimmer_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	&& (Orlan_SCGotHotelZimmer == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Orlan_HotelZimmer_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_HotelZimmer_15_00"); //Was kostet ein Zimmer bei dir?
	
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)|| (SC_IsRanger == TRUE)||(SCIsWearingRangerRing == TRUE)|| (Orlan_KnowsSCAsRanger == TRUE))
		{
			//ADDON>
			if ((SC_IsRanger == TRUE)||(SCIsWearingRangerRing == TRUE)|| (Orlan_KnowsSCAsRanger == TRUE))
			{
				AI_Output			(self, other, "DIA_Addon_Orlan_HotelZimmer_05_00"); //Für einen Bruder des 'Rings'? Gar nichts.
				Orlan_RangerHelpZimmer = TRUE;
				Orlan_KnowsSCAsRanger = TRUE;
			}
			//ADDON<
			else if (hero.guild == GIL_PAL)
			{
				AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_01"); //Für einen Ritter des Königs habe ich immer ein Zimmer frei. Unentgeltlich, versteht sich.
			}
			else
			{
				AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_02"); //Ich würde es nie wagen, einem irdischen Vertreter Innos Geld für meine Dienste abzunehmen.
			};
			
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_03"); //Hier hast du den Schlüssel für die oberen Zimmer. Such dir eins aus.
			CreateInvItems (self, ITKE_ORLAN_HOTELZIMMER, 1);									
			B_GiveInvItems (self, other, ITKE_ORLAN_HOTELZIMMER, 1);					
			Orlan_SCGotHotelZimmer = TRUE;
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_04"); //Gib mir 50 Goldmünzen für eine Woche und du kannst dir ein Zimmer aussuchen.
		
			Info_ClearChoices	(DIA_Orlan_HotelZimmer);
			Info_AddChoice	(DIA_Orlan_HotelZimmer, "Verdammt teuer.", DIA_Orlan_HotelZimmer_nein );
			Info_AddChoice	(DIA_Orlan_HotelZimmer, "In Ordnung. Hier hast du die Kohle.", DIA_Orlan_HotelZimmer_ja );
		};	
};
func void DIA_Orlan_HotelZimmer_ja ()
{
		if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(other, self, "DIA_Orlan_HotelZimmer_ja_15_00"); //In Ordnung. Hier hast du die Kohle.
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_ja_05_01"); //Hier ist der Schlüssel. Die Zimmer sind oben. Aber mach mir nicht alles dreckig und zahl deine Miete pünktlich, verstanden?
			CreateInvItems (self, ITKE_ORLAN_HOTELZIMMER, 1);									
			B_GiveInvItems (self, other, ITKE_ORLAN_HOTELZIMMER, 1);					
			Orlan_SCGotHotelZimmerDay = Wld_GetDay(); 
			Orlan_SCGotHotelZimmer = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_ja_05_02"); //Du hast keine 50. Erst das Geld, dann das Vergnügen.
		};
	Info_ClearChoices	(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein ()
{
	AI_Output			(other, self, "DIA_Orlan_HotelZimmer_nein_15_00"); //Verdammt teuer.
	AI_Output			(self, other, "DIA_Orlan_HotelZimmer_nein_05_01"); //Dann musst du es woanders versuchen, mein Freund.
	Info_ClearChoices	(DIA_Orlan_HotelZimmer);
};

///////////////////////////////////////////////////////////////////////
//	Info MieteFaellig
///////////////////////////////////////////////////////////////////////

var int Orlan_AngriffWegenMiete;
////////////////////////////////

instance DIA_Orlan_MieteFaellig		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	10;
	condition	 = 	DIA_Orlan_MieteFaellig_Condition;
	information	 = 	DIA_Orlan_MieteFaellig_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

var int DIA_Orlan_MieteFaellig_NoMore;
func int DIA_Orlan_MieteFaellig_Condition ()
{
	//ADDON>
	if ((SC_IsRanger == TRUE)|| (Orlan_RangerHelpZimmer == TRUE))
	{
		return FALSE;
	};
	//ADDON<
	
	// GEFRUDEL wegen kein Labern nach Kampf!
	
	if (Orlan_AngriffWegenMiete == TRUE)
	&& (DIA_Orlan_MieteFaellig_NoMore == FALSE)
	{	
		// ------ keine Miete, wenn Kampf verloren ------
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return FALSE;
		};
		
		// ------ wenn gewonnen, Gold genommen --> Miete in 7 Tagen ------
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AngriffWegenMiete = FALSE;
			return FALSE;
		};
	};
	
	// CONDITION
	
	if (Orlan_SCGotHotelZimmer == TRUE)
	&& (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay()-7))
	&& (DIA_Orlan_MieteFaellig_NoMore == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Orlan_MieteFaellig_Info ()
{
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output	(self, other, "DIA_Orlan_MieteFaellig_05_00"); //(schleimig) Ich freue mich über deinen hohen Besuch. Bleib so lange, wie du willst. Es ist mir eine Ehre.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Orlan_MieteFaellig_05_01"); //Wann bekomme ich endlich meine Miete?
	
		Info_ClearChoices	(DIA_Orlan_MieteFaellig);
		Info_AddChoice	(DIA_Orlan_MieteFaellig, "Vergiss es. Ich zahl dir nichts mehr.", DIA_Orlan_MieteFaellig_nein );
		Info_AddChoice	(DIA_Orlan_MieteFaellig, "Hier sind deine 50 Goldmünzen.", DIA_Orlan_MieteFaellig_ja );
	};
};

var int DIA_Orlan_MieteFaellig_OneTime;
func void DIA_Orlan_MieteFaellig_ja ()
{
		AI_Output			(other, self, "DIA_Orlan_MieteFaellig_ja_15_00"); //Hier sind deine 50 Goldmünzen.
	
		if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_01"); //Na, das wurde aber auch Zeit.

			if (DIA_Orlan_MieteFaellig_OneTime == FALSE)
			{
				AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_02"); //Wo treibst du dich eigentlich immer herum?
				AI_Output			(other, self, "DIA_Orlan_MieteFaellig_ja_15_03"); //Das willst du nicht wissen.
				AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_04"); //Mmh. Na ja, geht mich ja auch nichts an.
				DIA_Orlan_MieteFaellig_OneTime = TRUE;
			};
			
			Orlan_SCGotHotelZimmerDay = Wld_GetDay(); 
			Info_ClearChoices	(DIA_Orlan_MieteFaellig);
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_05"); //Sag mal, willst du mich verarschen? Du hast ja nicht mal genug Geld, um das Essen zu bezahlen. Dir werd ich helfen, du ...
			AI_StopProcessInfos (self);
			B_Attack (self, other, AR_NONE, 1);
		};
};

func void DIA_Orlan_MieteFaellig_nein ()
{
	AI_Output			(other, self, "DIA_Orlan_MieteFaellig_nein_15_00"); //Vergiss es. Ich zahl dir nichts mehr.
	AI_Output			(self, other, "DIA_Orlan_MieteFaellig_nein_05_01"); //Na, dir werd ich helfen, du elender Zechpreller.
	Orlan_AngriffWegenMiete = TRUE;
	
	Info_ClearChoices	(DIA_Orlan_MieteFaellig);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info WettkampfLaeuft
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_WETTKAMPFLAEUFT		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	7;
	condition	 = 	DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information	 = 	DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important	 = 	TRUE;
	 
};

func int DIA_Orlan_WETTKAMPFLAEUFT_Condition ()
{
	if 	(
		(DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE)
		&& (MIS_Rukhar_Wettkampf_Day <= (Wld_GetDay()-2))
		)
			{
					return TRUE;
			};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info ()
{
			AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_00"); //Da bist du ja endlich. Ich hab schon auf dich gewartet.
			AI_Output			(other, self, "DIA_Orlan_WETTKAMPFLAEUFT_15_01"); //Was ist passiert?
			AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_02"); //Das Wettsaufen ist endlich vorbei.
			AI_Output			(other, self, "DIA_Orlan_WETTKAMPFLAEUFT_15_03"); //Wer hat gewonnen?
	
			if 	(
				((Mob_HasItems	("CHEST_RUKHAR", ItFo_Booze)) == FALSE)
				&& ((Mob_HasItems	("CHEST_RUKHAR", ItFo_Water)) == TRUE)
				)
					{
						AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_04"); //Diesmal hat Randolph gewonnen. Rukhar hat wohl einen schlechten Tag gehabt.
					}
				else
				{
					AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_05"); //Rukhar hat Randolph wieder mal abgefüllt. War ja zu erwarten.
					Rukhar_Won_Wettkampf = TRUE;
				};
			
			if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
				{
					AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_06"); //So, also., ich hoffe, dass das das letzte Mal war. Ich will so ein Theater nicht mehr in meinem Haus haben, merk dir das.
				};
			
			B_GivePlayerXP (XP_Rukhar_WettkampfVorbei);	

			AI_StopProcessInfos (self);
		
			Npc_ExchangeRoutine	(self,"Start"); 
			B_StartotherRoutine	(Randolph,"Start");

			if (Hlp_IsValidNpc (Rukhar))
				{
				 if (Rukhar_Won_Wettkampf == TRUE)
				 	{
						B_StartotherRoutine (Rukhar,"WettkampfRukharWon");
					}
					else
					{
						B_StartotherRoutine (Rukhar,"WettkampfRukharLost");
					};
				};		
			
			MIS_Rukhar_Wettkampf = LOG_SUCCESS;
			B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Eingebrockt
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_EINGEBROCKT		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	8;
	condition	 = 	DIA_Orlan_EINGEBROCKT_Condition;
	information	 = 	DIA_Orlan_EINGEBROCKT_Info;
	important	 = 	TRUE;
};

func int DIA_Orlan_EINGEBROCKT_Condition ()
{
	if 	(
		(DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE)
		&& (MIS_Rukhar_Wettkampf == LOG_RUNNING)
		)
			{
					return TRUE;
			};
};

func void DIA_Orlan_EINGEBROCKT_Info ()
{
			AI_Output	(self, other, "DIA_Orlan_EINGEBROCKT_05_00"); //Da hast du mir ja was Schönes eingebrockt. Jetzt kann ich wieder den Aufpasser für Rukhar spielen.
			AI_Output	(other, self, "DIA_Orlan_EINGEBROCKT_15_01"); //Warum?
			AI_Output	(self, other, "DIA_Orlan_EINGEBROCKT_05_02"); //Solange er darin seine Wetten abhält, sollte besser kein Außenstehender davon erfahren. Ist nicht gut fürs Geschäft, verstehst du?
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_Perm		(C_INFO)
{
	npc			 = 	BAU_970_Orlan;
	nr			 = 	99;
	condition	 = 	DIA_Orlan_Perm_Condition;
	information	 = 	DIA_Orlan_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"Wie läuft deine Pinte?";
};

func int DIA_Orlan_Perm_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
		{
				return TRUE;
		};
};

func void DIA_Orlan_Perm_Info ()
{
	AI_Output (other, self, "DIA_Orlan_Perm_15_00"); //Wie läuft deine Pinte?
	
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Orlan_Perm_05_01"); //Es gab schon bessere Zeiten, weißt du?
		AI_Output (self, other, "DIA_Orlan_Perm_05_02"); //Der Geldbeutel hängt bei den Leuten nicht mehr so locker wie früher.
	}
	else if (Kapitel >= 3)
	{
		AI_Output (self, other, "DIA_Orlan_Perm_05_03"); //Hoffentlich verziehen sich diese schwarzen Magier bald wieder, sonst kann ich die Taverne dicht machen.
		AI_Output (self, other, "DIA_Orlan_Perm_05_04"); //Es traut sich ja fast keiner mehr hierher.
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Orlan_Minenanteil (C_INFO)
{
	npc			= BAU_970_Orlan;
	nr			= 3;
	condition	= DIA_Orlan_Minenanteil_Condition;
	information	= DIA_Orlan_Minenanteil_Info;

	description = "Du verkaufst Minenanteile?";
};   
                    
FUNC INT DIA_Orlan_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Orlan_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Orlan_Minenanteil_15_00"); //Du verkaufst Minenanteile?
	AI_Output (self, other, "DIA_Orlan_Minenanteil_05_01"); //Klar. Von mir kannst du alles bekommen, wenn der Preis stimmt.
	B_GivePlayerXP (XP_Ambient);
};	

 
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Orlan_PICKPOCKET (C_INFO)
{
	npc			= BAU_970_Orlan;
	nr			= 900;
	condition	= DIA_Orlan_PICKPOCKET_Condition;
	information	= DIA_Orlan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Orlan_PICKPOCKET_Condition()
{
	C_Beklauen (89, 260);
};
 
FUNC VOID DIA_Orlan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Orlan_PICKPOCKET);
	Info_AddChoice		(DIA_Orlan_PICKPOCKET, DIALOG_BACK 		,DIA_Orlan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Orlan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Orlan_PICKPOCKET_DoIt);
};

func void DIA_Orlan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Orlan_PICKPOCKET);
};
	
func void DIA_Orlan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Orlan_PICKPOCKET);
};








			

























