// ************************************************************
// 			  				 Exit 
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Exit(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 999;
	condition	= DIA_Addon_AlligatorJack_Exit_Condition;
	information	= DIA_Addon_AlligatorJack_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_AlligatorJack_Exit_Condition()
{
	return TRUE;	
};
var int DIA_Addon_AlligatorJack_Exit_Info_OneTime;
FUNC VOID DIA_Addon_AlligatorJack_Exit_Info()
{	
	
	if (MIS_KrokoJagd == LOG_SUCCESS)
	&& (DIA_Addon_AlligatorJack_Exit_Info_OneTime == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_Exit_12_00"); //Wenn du mich suchst, ich bin meistens irgendwo in der Nähe meines Lagerplatzes vor den Palisaden.
	
		if (PIR_1354_Addon_Henry.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			AI_Output (other ,self,"DIA_Addon_AlligatorJack_Exit_15_01"); //Palisaden?
			AI_Output (self ,other,"DIA_Addon_AlligatorJack_Exit_12_02"); //Geh einfach weiter Richtung Westen, dann siehst du, was ich meine.
		};
		
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine (self, "START");
		
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DIA_Addon_AlligatorJack_Exit_Info_OneTime = TRUE;
	};
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_AlligatorJack_PICKPOCKET (C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 900;
	condition	= DIA_Addon_AlligatorJack_PICKPOCKET_Condition;
	information	= DIA_Addon_AlligatorJack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_AlligatorJack_PICKPOCKET_Condition()
{
	C_Beklauen (100, 333);
};
 
FUNC VOID DIA_Addon_AlligatorJack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_AlligatorJack_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_AlligatorJack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_AlligatorJack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_AlligatorJack_PICKPOCKET_DoIt);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_AlligatorJack_PICKPOCKET);
};
	
func void DIA_Addon_AlligatorJack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_AlligatorJack_PICKPOCKET);
};
// ************************************************************
// 			  		Hello
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Hello(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_Hello_Condition;
	information	= DIA_Addon_AlligatorJack_Hello_Info;
	permanent	= FALSE;
	Important	= TRUE;
};                       
FUNC INT DIA_Addon_AlligatorJack_Hello_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_AlligatorJack_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_00"); //Was bist DU denn für einer. Du siehst nicht aus wie die anderen.
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Hello_15_01"); //Welche anderen?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_02"); //Na, die Magier, die sich da drüben bei den Ruinen herum treiben.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_03"); //Gehörst du etwa auch zu dem Verein?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_04"); //Ziemlich mutig von dir hier alleine rumzulaufen.
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_WerBistDu_Condition;
	information	 = 	DIA_Addon_AlligatorJack_WerBistDu_Info;

	description	 = 	"Wer bist du?";
};

func int DIA_Addon_AlligatorJack_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WerBistDu_15_00"); //Wer bist du?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_01"); //Du hast sicher schon von mir gehört.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_02"); //(stolz) Ich bin Alligator Jack.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_03"); //Gefürchtet im ganzen Land. Ich gehöre zu den wohl gefährlichsten Piraten in dieser Gegend.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_04"); //Mit unserem Kapitän Greg haben wir mehr Handelsschiffe geentert, als ich zählen kann.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_05"); //Du stehst hier sozusagen vor einer lebenden Legende.
};

///////////////////////////////////////////////////////////////////////
//	Info Vorschlag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Vorschlag		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Vorschlag_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Vorschlag_Info;

	description	 = 	"Kennst du einen Kerl namens Raven?";
};

func int DIA_Addon_AlligatorJack_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_AlligatorJack_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_15_00"); //Kennst du einen Kerl namens Raven?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_01"); //Na klar. Er ist der Anführer der Banditen im Osten.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_02"); //Was willst du denn von DEM?
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven sitzt zusammen mit seinen Banditen im Osten des Tals.");
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Vorschlag);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Vorschlag, "Ich will mich ihm anschließen.", DIA_Addon_AlligatorJack_Vorschlag_join );
	Info_AddChoice	(DIA_Addon_AlligatorJack_Vorschlag, "Ich muss ihn töten.", DIA_Addon_AlligatorJack_Vorschlag_tot );
};

func void 	B_AlligatorJack_Besser ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_00"); //Ich hab 'ne bessere Idee.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_01"); //Du kommst mit zu uns.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_02"); //Und da denkst du erst mal gründlich darüber nach.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_03"); //Nachdem du erstmal  unseren guten selbstgebrannten Rum probiert hast, sieht die Welt schon ganz anders aus.
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Vorschlag);
};
func void DIA_Addon_AlligatorJack_Vorschlag_tot ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_tot_15_00"); //Ich muss ihn töten.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_01"); //(lacht) Was denn? DU? Wie willst du DAS denn anstellen?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_02"); //Ist der Kerl nicht eine Nummer zu groß für dich?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_03"); //Du kommst ja nicht mal an ihn heran. Die Banditen, die er um sich geschart hat, werden dir vorher das Fell abziehen.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_04"); //Du kommst doch noch nicht mal an ihrem ersten Vorposten vorbei.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_05"); //So wie du aussiehst, kriegen die Banditen doch schon das Jucken in den Fingern, wenn sie dich von weitem sehen.
	
	B_AlligatorJack_Besser ();
};
func void DIA_Addon_AlligatorJack_Vorschlag_join ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_join_15_00"); //Ich will mich ihm anschließen.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_01"); //(lauernd) Tatsächlich?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_02"); //Du siehst aber gar nicht aus wie einer, der bei diesen Spinnern anheuern will.

	B_AlligatorJack_Besser ();
};

///////////////////////////////////////////////////////////////////////
//	Info BDTRuestung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_BDTRuestung		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_BDTRuestung_Condition;
	information	 = 	DIA_Addon_AlligatorJack_BDTRuestung_Info;

	description	 = 	"Ich brauche eine Banditenrüstung.";
};

func int DIA_Addon_AlligatorJack_BDTRuestung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_Vorschlag))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_BDTRuestung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_15_00"); //Ich brauche eine Banditenrüstung.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_01"); //Was willst du denn DAMIT?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_02"); //Die bringt dir nur Ärger ein, wenn du dich damit irgendwo sehen lässt.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_03"); //Jeder wird dich für einen Banditen halten und versuchen, dich zu töten.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_04"); //Außer den Banditen SELBST vielleicht.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_05"); //Die werden dich höchstens noch für einen von ihnen halten.
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice	(DIA_Addon_AlligatorJack_BDTRuestung, "Hast du eine Ahnung, wo ich eine solche Rüstung finden kann?", DIA_Addon_AlligatorJack_BDTRuestung_wo );
	Info_AddChoice	(DIA_Addon_AlligatorJack_BDTRuestung, "Hört sich gut an.", DIA_Addon_AlligatorJack_BDTRuestung_gut );
};
func void DIA_Addon_AlligatorJack_BDTRuestung_gut ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00"); //Hört sich gut an.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01"); //Ja, aber nur für jemand, der lebensmüde ist.
};
func void DIA_Addon_AlligatorJack_BDTRuestung_wo ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00"); //Hast du eine Ahnung, wo ich eine solche Rüstung finden kann?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01"); //Wir hatten mal eine bei uns im Piratenlager.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_02"); //Mmh ... Ich denke, die hatte genau deine Größe.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03"); //Aber, ob sie noch da ist, weiß ich nicht.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bei den Piraten hat es wohl mal eine Banditenrüstung gegeben. Ob sie aber noch existiert, konnte Alligator Jack mir nicht sagen."); 
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_BDTRuestung);
};

///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Greg		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Greg_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Greg_Info;

	description	 = 	"Euer Kapitän heißt Greg?";
};

func int DIA_Addon_AlligatorJack_Greg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_00"); //Euer Kapitän heißt Greg?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_01"); //Richtig. Er ist der größte Pirat, den die See jemals hervor gebracht hat.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_02"); //Ich glaube, ich kenne euren Kapitän. Er ist mir in Khorinis begegnet.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_03"); //(lacht) Greg? In Khorinis? Unsinn!
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_04"); //Greg ist mit einigen Jungs auf großer Kaperfahrt.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_05"); //Das einzige, was Greg nach Khorinis bringen würde, wäre eine Sträflingsgaleere des Königs.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_06"); //Er ist einer der meistgesuchten Männer im Land.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_07"); //Freiwillig geht er bestimmt nicht in die Stadt und lässt sich von der königlichen Garde in den Kerker werfen.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_08"); //Wenn du meinst.
};

///////////////////////////////////////////////////////////////////////
//	Info PIRLager
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_PIRLager		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_PIRLager_Condition;
	information	 = 	DIA_Addon_AlligatorJack_PIRLager_Info;

	description	 = 	"Wo ist euer Piratenlager?";
};

func int DIA_Addon_AlligatorJack_PIRLager_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_PIRLager_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_00"); //Wo ist euer Piratenlager?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_01"); //Siehst du den Höhlendurchgang da drüben. Wenn du da durch gehst und weiter nach Westen gehst, kommst du früher oder später zu unserem Strand.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_02"); //Da haben wir unsere Blockhütten.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_03"); //Wenn du willst, kann ich dich hin bringen, wenn du mir einen Gefallen tust.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_04"); //Und das wäre?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_05"); //Bevor ich zum Lager zurück kann, muss ich erst noch Fleisch für die Jungs besorgen.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_06"); //Du bist ein kräftiger Kerl.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_07"); //Ich könnte deine Hilfe bei der Jagd gebrauchen. Interessiert?

	Log_CreateTopic (TOPIC_Addon_RatHunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_RatHunt,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RatHunt,"Alligator Jack kann Hilfe bei der Jagd gebrauchen.");

};

///////////////////////////////////////////////////////////////////////
//	Info WasJagen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_WasJagen		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_WasJagen_Condition;
	information	 = 	DIA_Addon_AlligatorJack_WasJagen_Info;

	description	 = 	"Was jagst du denn?";
};

func int DIA_Addon_AlligatorJack_WasJagen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_WasJagen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_00"); //Was jagst du denn?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_01"); //Normalerweise nur Alligatoren. Aber die kann man nicht essen.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_02"); //Außerdem gibt es hier in der Gegend auch gar keine mehr.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_03"); //Also nehme ich das, was da ist. Sumpfratten.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_04"); //Was?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_05"); //Die meisten Viecher, die es hier gibt, schmecken wie eingeschlafene Füße oder sind zäh wie Alligatorfleisch.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_06"); //Die fetten Sumpfratten sind das einzige, was einigermaßen geniesbar ist.

	B_LogEntry (TOPIC_Addon_RatHunt,"Das einzige, was hier in der Gegend genießbar sein soll, sind Sumpfratten.");
};

// ************************************************************
//				Pirates
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Pirates(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_Pirates_Condition;
	information	= DIA_Addon_AlligatorJack_Pirates_Info;
	permanent	= FALSE;
	description	= "Erzähl mir mehr über euch Piraten.";
};                       
FUNC INT DIA_Addon_AlligatorJack_Pirates_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_PIRLager))
		{
			return TRUE;
		};
};

FUNC VOID DIA_Addon_AlligatorJack_Pirates_Info()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Pirates_15_00"); //Erzähl mir mehr über euch Piraten.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_01"); //Wir leben hier schon seit Jahren. Damals vor dem Krieg kannte uns jeder von hier bis zum Festland.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_02"); //Allein unsere Flagge verbreitete Angst und Schrecken unter den Kauffahrern.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_03"); //Aber die Zeiten sind nun vorbei. Schon seit Wochen haben wir kein Handelsschiff mehr vor den Bug gekriegt.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_04"); //Unser Kapitän Greg ist los und versucht, noch mal eins zu erwischen.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_05"); //Wir anderen sitzen in unserem Lager und drehen Däumchen, bis er wieder da ist.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_06"); //Hoffentlich bringt er fette Beute mit.
};


// ************************************************************
// 			  			Lass uns jagen gehen
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_LetsGoHunting(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_LetsGoHunting_Condition;
	information	= DIA_Addon_AlligatorJack_LetsGoHunting_Info;
	permanent	= TRUE;
	description = "Lass uns jagen gehen.";
};                       
FUNC INT DIA_Addon_AlligatorJack_LetsGoHunting_Condition()
{
	if (MIS_KrokoJagd == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_WasJagen)) 
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00"); //Lass uns jagen gehen.
	AI_Output (self,other ,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01"); //Gut. Zu zweit ist es ein Kinderspiel.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02"); //Bist du bereit?
	
	Info_ClearChoices (DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice (DIA_Addon_AlligatorJack_LetsGoHunting,"Nein, noch nicht.",DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice (DIA_Addon_AlligatorJack_LetsGoHunting,"Ja.",DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};
const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;
FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00"); //Ja.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01"); //Gut. Bleib mir einfach auf den Fersen.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self, "HUNT1");
		
		
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_07");

	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
		
	AlligatorJack_JagdStart = AlligatorJack_Inter1;
	
	MIS_KrokoJagd = LOG_RUNNING;
};

FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_No()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00"); //Nein, noch nicht.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01"); //Dann beeil dich.
	
	Info_ClearChoices (DIA_Addon_AlligatorJack_LetsGoHunting);
};

///////////////////////////////////////////////////////////////////////
//	Info AlligatorJackInter1
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_AlligatorJackInter1		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition;
	information	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter1_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Inter1)
	&& Npc_GetDistToWP (self,"ADW_PIRATECAMP_WAY_16") <= 500  
		{
			return TRUE;
		};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter1_Info ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00"); //Der Talkessel.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01"); //Hier müssten einige von den Biestern sein.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02"); //Folge mir.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT2");
	AlligatorJack_JagdStart = AlligatorJack_Kessel;
};


///////////////////////////////////////////////////////////////////////
//	Info Das habe ich befürchtet
///////////////////////////////////////////////////////////////////////

instance DIA_Addon_AlligatorJack_TheHunt		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_TheHunt_Condition;
	information	 = 	DIA_Addon_AlligatorJack_TheHunt_Info;
	permanent 	 = 	FALSE;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_TheHunt_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Kessel)
	&& (Npc_GetDistToWP (self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TheHunt_Info ()
{
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_00"); //Das habe ich befürchtet.
	AI_Output 	(other ,self, "DIA_Addon_AlligatorJack_TheHunt_15_01"); //Was?
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_02"); //Die paar Viecher hier sind grade mal die Hälfte von dem, was ich brauche.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_03"); //Jetzt müssen wir in den Canyon.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_04"); //Pass auf, tiefer im Canyon wird's brandgefährlich.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_05"); //Wenn dir dein Leben lieb ist, bleib schön dicht bei mir.
	
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_10");

	Info_ClearChoices (DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice (DIA_Addon_AlligatorJack_TheHunt,"Was IST in dem Canyon?",DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice (DIA_Addon_AlligatorJack_TheHunt,"Gut, lass uns gehen.",DIA_Addon_AlligatorJack_TheHunt_Running);
};

FUNC VOID DIA_Addon_AlligatorJack_TheHunt_Enough ()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00"); //Was IST im Canyon?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01"); //Wenn es irgendwie geht, meiden wir das Gebiet.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02"); //Dort gibt es Razor. Ziemlich zähe Biester. Halt dich von denen fern, wenn du an deinem Leben hängst.
};

FUNC VOID DIA_Addon_AlligatorJack_TheHunt_Running ()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00"); //Gut, lass uns gehen.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01"); //Alles klar.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT3");
	AlligatorJack_JagdStart = AlligatorJack_Inter2;
};

///////////////////////////////////////////////////////////////////////
//	Info AlligatorJackInter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_AlligatorJackInter2		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition;
	information	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Inter2)
	&& (Npc_GetDistToWP (self,"ADW_PIRATECAMP_WAY_16") <= 500)
	&& (GregIsBack == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00"); //Komm schon.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT4");
	AlligatorJack_JagdStart = AlligatorJack_Canyon;
};

///////////////////////////////////////////////////////////////////////
//	Info Das ist jetzt aber genug
///////////////////////////////////////////////////////////////////////

instance DIA_Addon_AlligatorJack_HuntEnd		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_HuntEnd_Condition;
	information	 = 	DIA_Addon_AlligatorJack_HuntEnd_Info;
	permanent 	 = 	FALSE;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_HuntEnd_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Canyon)
	&& (Npc_GetDistToWP (self,"ADW_CANYON_TELEPORT_PATH_06") <= 500)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_HuntEnd_Info ()
{
	if (AlligatorJack_KrokosKilled == 0)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00"); //Sag mal, kannst du mir sagen, wofür ich dich mitnehme?
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01"); //Keine einzige Sumpfratte hast du getötet.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02"); //Naja. Vielleicht kannst du dich ja trotzdem noch nützlich machen.
		
	}
	else if AlligatorJack_KrokosKilled == 1
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03"); //Gut gemacht, so jemanden wie dich können wir brauchen.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04"); //Bei deiner ersten Jagd gleich eins von diesen Biestern erlegt. Nicht schlecht.
	}
	else	//mehr als 1!!
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05"); //Du bist ein Jagdtalent.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06"); //Meine Fresse, wenn du so weiter machst, kann ich demnächst im Lager bleiben.
	};
	
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_07"); //Hier, nimm das Sumpfrattenfleisch und bringe es zu Morgan, dem Faulpelz.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_08"); //Du findest ihn bei uns im Lager.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_09"); //Er liegt sicher wieder irgendwo am Strand. Ich denke, er wartet schon darauf.
	
	if (PIR_1354_Addon_Henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_10"); //Am Eingang unseres Lagers steht meistens Henry und passt auf, dass uns die Banditen nicht angreifen.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_11"); //Wenn er dich nicht rein lassen will, sag ihm einfach, dass ich dich geschickt habe.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_12"); //Vielleicht ist er dann ein bisschen umgänglicher.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_13"); //Henry ist etwas übereifrig und markiert immer gerne den Boss.
	};
	
	MIS_AlligatorJack_BringMeat = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_BringMeat,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BringMeat,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BringMeat,"Alligator Jack hat mir 10 Stücke Fleisch gegeben. Ich soll sie zu Morgan bringen.");

	B_LogEntry (TOPIC_Addon_RatHunt,"Die Jagd war erfolgreich. Wir haben mehrere Sumpfratten erlegt.");
	
	B_GiveInvItems (self ,other,ItFoMuttonRaw,10);
	MIS_KrokoJagd = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_KrokoJagd);
};


///////////////////////////////////////////////////////////////////////
//		Angus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Angus		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Angus_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Angus_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Kennst du Angus und seinen Freund Hank?";

};

func int DIA_Addon_AlligatorJack_Angus_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bill_AngusnHank)	== TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Addon_AlligatorJack_Angus_Info ()
{
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Angus_15_00"); //Kennst du Angus und seinen Freund Hank?
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_03"); //Ich hab sie schon länger nicht mehr gesehen.
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_04"); //Außerdem hätte ich nichts dagegen, wenn die beiden auch nicht wieder auftauchen.
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Angus_15_05"); //Warum?
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_06"); //Ach, die Penner haben ständig am See rumgehangen und das Wild vertrieben.
};

///////////////////////////////////////////////////////////////////////
//		Angus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Lake		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Lake_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Lake_Info;
	permanent 	 = 	FALSE;
	description	 = 	"An welchem See hängen sie ständig rum?";
};

func int DIA_Addon_AlligatorJack_Lake_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_Angus) == TRUE)
	&& (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Lake_Info ()
{
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Lake_15_00"); //An WELCHEM See hängen sie ständig rum?

	if (MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_01"); //Erinnerst du dich an unsere Jagd?
		AI_Output	(other,self , "DIA_Addon_AlligatorJack_Lake_15_02"); //Ja.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_03"); //Der See in dem Talkessel. Dort habe ich sie meistens gesehen.
	}
	else
	{
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_04"); //Am See im großen Talkessel.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_05"); //Du gehst von unserem Lager aus einfach nach Osten. Den Talkessel kannst du gar nicht übersehen.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_06"); //Es gibt dort viel kleine Wasserfälle.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_07"); //Aber pass auf, wenn du nur noch trockenen Sand unter den Füßen hast, bist du falsch abgebogen und in den Canyon gelaufen.
	};
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Die Höhle ist wohl in dem Talkessel östlich des Lagers. Direkt bei dem See.");
};
	
///////////////////////////////////////////////////////////////////////
//	Info kannst du mir was beibringen?
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_CanLearn		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_CanLearn_Condition;
	information	 = 	DIA_Addon_AlligatorJack_CanLearn_Info;
	permanent 	 = 	TRUE;
	description	 = 	"Kannst du mir was beibringen?";

};

func int DIA_Addon_AlligatorJack_CanLearn_Condition ()
{
	if (AlligatorJack_Addon_TeachPlayer == FALSE)
	{
		if ((Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_HuntEnd) == TRUE)
		|| (GregIsBack == TRUE))
		{
			return TRUE;
		};	
	};
};

func void DIA_Addon_AlligatorJack_CanLearn_Info ()
{
	AI_Output	(other,self ,"DIA_Addon_AlligatorJack_CanLearn_15_00"); //Kannst du mir was beibringen?
	
	if MIS_KrokoJagd > LOG_RUNNING
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_01"); //Klar, ich bin ein guter Jäger, ich kann dir zeigen wie man Tiere enthäutet und ihnen die Zähne zieht.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_02"); //Wenn du willst, bring ich es dir bei.
		
		Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry		(Topic_Addon_PIR_Teacher,"Alligator Jack kann mir zeigen, wie ich Tieren das Fell abziehe oder ihre Zähne herausbreche. Außerdem kann er mich im Bogenschießen unterrichten.");
		
		AlligatorJack_Addon_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_03"); //Zeig mir erst mal, dass du bereit bist für die Jagd.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_04"); //Wenn wir zusammen auf der Jagd waren, werde ich es vielleicht tun.
	};
};
///////////////////////////////////////////////////////////////////////
FUNC VOID B_AJ_Teach()
{
	Info_ClearChoices (DIA_Addon_AlligatorJack_Teach);
		
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach,DIALOG_BACK,DIA_Addon_AlligatorJack_Teach_Back);
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5) ,DIA_Addon_AlligatorJack_Teach_Bow_5);
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))	 ,DIA_Addon_AlligatorJack_Teach_Bow_1);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString ("Tiere häuten",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)),  DIA_Addon_AlligatorJack_Teach_FUR);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString ("Zähne ziehen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Addon_AlligatorJack_Teach_Teeth);
};
///////////////////////////////////////////////////////////////////////
//	Info Unterrichte mich!
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Teach		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Teach_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Teach_Info;
	permanent 	 = 	TRUE;
	description	 = 	"Unterrichte mich!";
};
func int DIA_Addon_AlligatorJack_Teach_Condition ()
{
	if (AlligatorJack_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};	
};
func void DIA_Addon_AlligatorJack_Teach_Info ()
{
	AI_Output	(other,self ,"DIA_Addon_AlligatorJack_Teach_15_00"); //Unterrichte mich!
	AI_Output 	(self ,other,"DIA_Addon_AlligatorJack_Teach_12_01"); //Was soll ich dir beibringen?
		
	B_AJ_Teach();

	//Wird nicht mehr gebraucht M.F. 
	//AI_Output 	(self ,other,"DIA_Addon_AlligatorJack_Teach_12_02"); //Ich kann dir nichts mehr beibringen.
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_Back ()
{
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Teach);
};
func void DIA_Addon_AlligatorJack_Teach_Bow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 75);
	B_AJ_Teach();
};
func void DIA_Addon_AlligatorJack_Teach_Bow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 75);
	B_AJ_Teach();
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_FUR()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ReptileSkin] == FALSE)
	{
		if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ReptileSkin))
		{
			AI_Output (self, other, "DIA_Addon_AlligatorJack_Teach_Fur_12_00"); //Und immer nur am Bauch aufschneiden, sonst verminderst du die Qualität.
		};
	}
	else
	{
		B_Say (self, other, "$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_Teeth()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{
		 B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth);
	}
	else
	{
		B_Say (self, other, "$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
func void B_AlliJack_AlliKlar()
{
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Anheuern_12_01"); //Alles klar.
};
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_Anheuern(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 11;
	condition	= DIA_Addon_AlligatorJack_Anheuern_Condition;
	information	= DIA_Addon_AlligatorJack_Anheuern_Info;
	permanent	= FALSE;
	description = "Lass uns jagen gehen.";
};                       
FUNC INT DIA_Addon_AlligatorJack_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_AlligatorJack_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Anheuern_15_00"); //Lass uns jagen gehen.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos (self);
	B_Addon_PiratesFollowAgain();
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_ComeOn(C_INFO)
{
	npc			= 	PIR_1352_Addon_AlligatorJack;
	nr		 	= 	12;
	condition	= 	DIA_Addon_AlligatorJack_ComeOn_Condition;
	information	= 	DIA_Addon_AlligatorJack_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Komm mit.";
};
func int DIA_Addon_AlligatorJack_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_AlligatorJack_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_KommMit_15_00"); //Komm mit.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
		AI_StopProcessInfos (self);
	}
	else
	{
		B_AlliJack_AlliKlar();
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_AlligatorJack_GoHome(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 13;
	condition	= DIA_Addon_AlligatorJack_GoHome_Condition;
	information	= DIA_Addon_AlligatorJack_GoHome_Info;
	permanent	= TRUE;
	description = "Ich brauch dich nicht mehr.";
};                       
FUNC INT DIA_Addon_AlligatorJack_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_AlligatorJack_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_DontNeedYou_15_00"); //Ich brauch dich nicht mehr.
	B_AlliJack_AlliKlar();

	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_AlligatorJack_TooFar(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 14;
	condition	= DIA_Addon_AlligatorJack_TooFar_Condition;
	information	= DIA_Addon_AlligatorJack_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_AlligatorJack_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_AlligatorJack_TooFar_Info()
{	
	B_Say(self, other, "$RUNAWAY");
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};






	




	






































