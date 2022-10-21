///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Maleth_EXIT   (C_INFO)
{
	npc         = BAU_954_Maleth;
	nr          = 999;
	condition   = DIA_Maleth_EXIT_Condition;
	information = DIA_Maleth_EXIT_Info;
	permanent   = TRUE;
	description = "Ich muss weiter!";
};
FUNC INT DIA_Maleth_EXIT_Condition()
{
	if (Kapitel	< 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Maleth_ersterWolf == FALSE)
	{
		Wld_InsertNpc		(YWolf,	"NW_FARM1_PATH_CITY_SHEEP_06");
		Maleth_ersterWolf = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Hallo (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_Hallo_Condition;
	information	= DIA_Maleth_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};

func int DIA_Maleth_Hallo_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Maleth_Hallo_08_00"); //Hey, Fremder!

	if (hero.guild == GIL_NONE)
		{
		
			if (Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_01"); //Ich hab gesehen, wie du aus den Bergen gekommen bist.
			};
			AI_Output (self, other, "DIA_Maleth_Hallo_08_02"); //Du kannst froh sein, hier nicht vor drei Wochen vorbeigekommen zu sein.
			AI_Output (self, other, "DIA_Maleth_Hallo_08_03"); //Wir hätten dich für 'nen entlaufenen Sträfling gehalten. Und mit denen haben wir kurzen Prozess gemacht!
			
			if (Npc_HasEquippedArmor(other) == FALSE) 
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_04"); //Du siehst ganz schön fertig aus.
			}
			else
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_05"); //Du sahst ganz schön fertig aus, als du ankamst.
				AI_Output (self, other, "DIA_Maleth_Hallo_08_06"); //Na ja, mittlerweile siehst du ja wieder aus wie'n Mensch!
			};
		};

	AI_Output (self, other, "DIA_Maleth_Hallo_08_07"); //(misstrauisch) Was willst du hier?
};

///////////////////////////////////////////////////////////////////////
//	Banditen Überfall
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BANDITS		(C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BANDITS_Condition;
	information	= DIA_Maleth_BANDITS_Info;
	permanent   = FALSE;
	description	= "Ich wurde in den Bergen von Banditen überfallen.";
};

func int DIA_Maleth_BANDITS_Condition ()
{
	if (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BANDITS_15_00"); //Ich wurde in den Bergen von Banditen überfallen.
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_01"); //Dieses Dreckspack! Wahrscheinlich waren's dieselben Mistkerle, die letzte Nacht eins von unseren Schafen geholt haben!
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_02"); //Du hast ganz schön Glück gehabt. Die meisten kommen NICHT mit dem Leben davon.
};

///////////////////////////////////////////////////////////////////////
//	Banditen tot
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsDEAD	(C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsDEAD_Condition;
	information	= DIA_Maleth_BanditsDEAD_Info;
	permanent   = FALSE;
	description	= "Die Banditen werden dir keinen Ärger mehr machen...";
};

func int DIA_Maleth_BanditsDEAD_Condition ()
{
	if ( Npc_IsDead (Ambusher_1013) || (Bdt_1013_Away == TRUE) )
	&& (Npc_IsDead (Ambusher_1014)) 
	&& (Npc_IsDead (Ambusher_1015))
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsDEAD_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_00"); //Die Banditen werden dir keinen Ärger mehr machen...
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_01"); //Warum? Sind sie tot?
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_02"); //Sie haben sich mit dem falschen Mann angelegt ...
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_03"); //Innos sei Dank! Hier - es ist nicht viel, aber du sollst es haben!
	B_GiveInvItems (self, other, ItFo_Wine, 3);
	
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_MalethKillBandits);
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_04"); //Ich werde den anderen davon erzählen!
};

///////////////////////////////////////////////////////////////////////
//	Banditen leben noch
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsALIVE (C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsALIVE_Condition;
	information	= DIA_Maleth_BanditsALIVE_Info;
	permanent   = FALSE;
	description	= "Ich kenne das Versteck der Banditen...";
};

func int DIA_Maleth_BanditsALIVE_Condition ()
{
	var C_NPC b13; b13 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	var C_NPC b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_NPC b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);
	
	if ( (!Npc_IsDead (b13)) || (!Npc_IsDead (b14)) || (!Npc_IsDead (b15)) )
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	&& (MIS_Maleth_Bandits != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsALIVE_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsALIVE_15_00"); //Ich kenne das Versteck der Banditen...
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_01"); //Willst du sie etwa angreifen? Ohne mich! Es ist viel zu gefährlich!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_02"); //Außerdem muss ich hier auf meine Schafe aufpassen!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_03"); //Aber wenn du meinst, du kannst uns das Pack vom Hals schaffen, werden dir alle auf dem Hof dafür sehr dankbar sein.
	MIS_Maleth_Bandits = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Maleth,LOG_RUNNING);
	B_LogEntry (TOPIC_Maleth,"Wenn ich die Banditen auf dem Weg von Xardas Turm zu Lobart's Hof besiege, werden mir alle auf dem Hof dankbar sein.");
	
};


///////////////////////////////////////////////////////////////////////
//	Auf dem Weg in die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_ToTheCity (C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 2;
	condition	= DIA_Maleth_ToTheCity_Condition;
	information	= DIA_Maleth_ToTheCity_Info;
	permanent   = FALSE;
	description	= "Ich bin auf dem Weg in die Stadt.";
};

func int DIA_Maleth_ToTheCity_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info ()
{
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_00"); //Ich bin auf dem Weg in die Stadt.
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_01"); //So, wie du rumläufst, wirst du die Wachen bestechen müssen, damit sie dich reinlassen.
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_02"); //Und du musst wissen, was sie hören wollen.
	}
	else
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_03"); //Kann schon sein, dass sie dich reinlassen - wenn du ihnen das erzählst, was sie hören wollen ...
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_04"); //Und das wäre?
	AI_Output (self, other, "DIA_Maleth_ToTheCity_08_05"); //Na, zum Beispiel, dass du von Lobarts Hof kommst und in der Stadt zum Schmied willst.
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Um in die Stadt zu gelangen, kann ich den Torwachen erzählen, das ich von Lobart's Hof komme und zum Schmied will.");
	
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_06"); //Aber das wird dir nichts nützen. Du siehst nicht aus wie ein Bauer.
		B_LogEntry (TOPIC_City,"Natürlich muss ich dafür aussehen, wie ein Bauer... ");
		
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_07"); //Verstehe.
};
	
	
	

///////////////////////////////////////////////////////////////////////
//	Bessere Ausrüstung
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Equipment		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_Equipment_Condition;
	information	= DIA_Maleth_Equipment_Info;
	permanent   = FALSE;
	description	= "Ich brauche bessere Ausrüstung!";
};

func int DIA_Maleth_Equipment_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info ()
{
	AI_Output (other, self, "DIA_Maleth_Equipment_15_00"); //Ich brauche bessere Ausrüstung!
	AI_Output (self, other, "DIA_Maleth_Equipment_08_01"); //Kann ich mir schon vorstellen. Aber ich sag dir gleich: Zu verschenken haben wir hier nichts!
	if (!Npc_IsDead(Lobart))
	{
		AI_Output (self, other, "DIA_Maleth_Equipment_08_02"); //Wenn du für das, was du willst, bezahlen kannst, wird Lobart dir was verkaufen.
		AI_Output (self, other, "DIA_Maleth_Equipment_08_03"); //Ansonsten geh zu ihm und frag ihn, ob er Arbeit für dich hat.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Lobart
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_LOBART		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_LOBART_Condition;
	information	= DIA_Maleth_LOBART_Info;
	permanent   = FALSE;
	description	= "Wo finde ich Lobart?";
};

func int DIA_Maleth_LOBART_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Equipment))
	&& (!Npc_IsDead(Lobart))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info ()
{
	AI_Output (other, self, "DIA_Maleth_LOBART_15_00"); //Wo finde ich Lobart?
	AI_Output (self, other, "DIA_Maleth_LOBART_08_01"); //Na, auf dem Hof natürlich! Der Hof gehört ihm!
	AI_Output (self, other, "DIA_Maleth_LOBART_08_02"); //Und komm ihm ja nicht krumm! Er hat schon so manchen Streuner von seinem Hof geprügelt.
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

INSTANCE DIA_Maleth_KAP3_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP3_EXIT_Condition;
	information	= DIA_Maleth_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info probleme
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PROBLEME		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	30;
	condition	 = 	DIA_Maleth_PROBLEME_Condition;
	information	 = 	DIA_Maleth_PROBLEME_Info;

	description	 = 	"Gab es irgendwas neues in den letzten Tagen?";
};

func int DIA_Maleth_PROBLEME_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_PROBLEME_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_15_00"); //Gab es irgendwas Neues in den letzten Tagen?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_01"); //Geh doch einfach mal den Feldweg zur Stadt entlang.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_02"); //Wenn du einem Kerl mit einer schwarzen Kutte begegnest, dann weißt du, was es Neues gibt.
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Wie geht´s deinen Schafen?", DIA_Maleth_PROBLEME_schafe );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Sind die schwarzen Männer schon bei dir gewesen?", DIA_Maleth_PROBLEME_beidir );
	
};
func void DIA_Maleth_PROBLEME_beidir ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_beidir_15_00"); //Sind die schwarzen Männer schon bei dir gewesen?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_beidir_08_01"); //Ja. Sie sind schon einige Tage hier. Wenn du mich fragst, kommen sie direkt aus der Hölle.

};

func void DIA_Maleth_PROBLEME_schafe ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_15_00"); //Wie geht's deinen Schafen?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_08_01"); //(erbost) Als ob dich das interessieren würde. Du hast ganz andere Probleme.
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Meine Probleme? Was weißt du denn schon davon?", DIA_Maleth_PROBLEME_schafe_probleme );

};
func void DIA_Maleth_PROBLEME_schafe_probleme ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_15_00"); //Meine Probleme? Was weißt du denn schon davon?
	
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_01"); //(barsch) Du gehörst doch zur Stadtgarde, oder nicht? Dann unternimm doch endlich mal was gegen diese schwarzen Mistkerle.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_02"); //(verärgert) Ihr dreckigen Söldner habt doch nur eins im Kopf: Wie kommt anderer Leute Geld in meine Tasche.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_03"); //Ihr edlen Herren aus dem Kloster solltet was gegen diese Kapuzentypen unternehmen.
		};

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Du riskierst ´ne ganz schön dicke Lippe, Freundchen.", DIA_Maleth_PROBLEME_schafe_probleme_drohen );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Info_AddChoice	(DIA_Maleth_PROBLEME, "Was ist dein Problem?", DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag );
		};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00"); //Was ist dein Problem?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01"); //Das kam alles nur von diesem schwarzgebrannten Fusel, den Vino mir vor einigen Wochen angedreht hat.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02"); //Ich kann mich an fast nichts mehr erinnern, Mann. Ich weiß nur, dass ich meinen Gehstock seitdem vermisse.
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03"); //Deswegen machst du so einen Aufstand?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04"); //Du hast gut Reden, dir gehört er ja nicht.
	
	Log_CreateTopic (TOPIC_MalethsGehstock, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock, LOG_RUNNING);
	B_LogEntry (TOPIC_MalethsGehstock,"Maleth hat seinen Gehstock im verloren. Er war völlig betrunken. So wie ich ihn einschätze ist er nicht weit weg von Lobarts Hof gewesen. Ich sollte das Ding dort irgendwo finden."); 

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00"); //Du riskierst 'ne ganz schön dicke Lippe, Freundchen.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01"); //Du kannst doch auch nur große Reden schwingen. Am besten, du verschwindest wieder.
};

func void DIA_Maleth_PROBLEME_Back ()
{
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

///////////////////////////////////////////////////////////////////////
//	Info Gehstock
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_GEHSTOCK		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_GEHSTOCK_Condition;
	information	 = 	DIA_Maleth_GEHSTOCK_Info;

	description	 = 	"Ich glaube, dieser Gehstock gehört dir.";
};

func int DIA_Maleth_GEHSTOCK_Condition ()
{
	if (Npc_HasItems (other,ItMw_MalethsGehstock_MIS))
	&& (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
		{
				return TRUE;
		};
};

func void DIA_Maleth_GEHSTOCK_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_00"); //Ich glaube, dieser Gehstock gehört dir.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_01"); //Das ist ja großartig. Ich ...
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_02"); //Moment. Erst bezahlst du dafür.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_03"); //Aber... ich habe nicht viel.
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_04"); //Dann lass dir was anderes einfallen.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_05"); //Ok. Wie wär's damit? Ich habe gestern einige Banditen mit ein paar Goldsäcken vorbeilaufen sehen.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_06"); //Wenn ich dir verrate, wo die Kerle ihre Beute lagern, bekomme ich dann meinen Gehstock zurück?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP (XP_FoundMalethsGehstock);

	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "Kein Interesse. Ich will dein Gold.", DIA_Maleth_GEHSTOCK_gold );
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "In Ordnung.", DIA_Maleth_GEHSTOCK_ok );
};
func void DIA_Maleth_GEHSTOCK_ok ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_ok_15_00"); //In Ordnung.
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_01"); //Ok. Du gehst einfach dort drüben in das Waldstück im Westen. Dort findest du eine Schlucht im Fels.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_02"); //In der Höhle dort solltest du eigentlich etwas finden.

	B_LogEntry (TOPIC_MalethsGehstock,"Maleth veriet mir, dass es ein gösseres Banditenlager im Waldstück im Westen von Lobarts Hof geben soll. "); 
	CreateInvItems 		(BDT_1024_MalethsBandit, ItMi_MalethsBanditGold,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos (self);
};

func void DIA_Maleth_GEHSTOCK_gold ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_gold_15_00"); //Kein Interesse. Ich will dein Gold.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_gold_08_01"); //Hier hast du alles, was ich habe. Das muss genügen.
	CreateInvItems 		(self, Itmi_Gold, 35);
	B_GiveInvItems 		(self, other, Itmi_Gold,35);
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PERM3		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_PERM3_Condition;
	information	 = 	DIA_Maleth_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Reg dich nicht so auf. ";
};

func int DIA_Maleth_PERM3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
	&& (Kapitel >= 3)
			{
					return TRUE;
			};
};

func void DIA_Maleth_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PERM3_15_00"); //Reg dich nicht so auf.
	AI_Output			(self, other, "DIA_Maleth_PERM3_08_01"); //(genervt) Hau schon ab.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Maleth_KAP4_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP4_EXIT_Condition;
	information	= DIA_Maleth_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Maleth_KAP5_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP5_EXIT_Condition;
	information	= DIA_Maleth_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP5_EXIT_Info()
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


INSTANCE DIA_Maleth_KAP6_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP6_EXIT_Condition;
	information	= DIA_Maleth_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maleth_PICKPOCKET (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 900;
	condition	= DIA_Maleth_PICKPOCKET_Condition;
	information	= DIA_Maleth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Maleth_PICKPOCKET_Condition()
{
	C_Beklauen (10, 10);
};
 
FUNC VOID DIA_Maleth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maleth_PICKPOCKET);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_BACK 		,DIA_Maleth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maleth_PICKPOCKET_DoIt);
};

func void DIA_Maleth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};
	
func void DIA_Maleth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};






































































