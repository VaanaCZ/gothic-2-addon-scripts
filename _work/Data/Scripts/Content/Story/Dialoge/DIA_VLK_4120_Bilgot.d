///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bilgot_EXIT   (C_INFO)
{
	npc         = VLK_4120_Bilgot;
	nr          = 999;
	condition   = DIA_Bilgot_EXIT_Condition;
	information = DIA_Bilgot_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_HALLO_Condition;
	information	 = 	DIA_Bilgot_HALLO_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};
func int DIA_Bilgot_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bilgot_HALLO_05_00"); //Hey, wo kommst du her? Bist du aus der Burg gekommen?

	Info_AddChoice	(DIA_Bilgot_HALLO, "Ja, ich komme aus der Burg - warum?", DIA_Bilgot_HALLO_Burg );
	Info_AddChoice	(DIA_Bilgot_HALLO, "Ich bin nur zufällig hier...", DIA_Bilgot_HALLO_Zufall );
};
func void DIA_Bilgot_HALLO_Zufall ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //Ich bin nur zufällig hier ...
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //Junge, niemand kommt ZUFÄLLIG hier vorbei. Wir sind hier am Arsch - umgeben von Snappern!
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //Bisher ist kein Tag vergangen, an dem nicht einer von uns ins Gras gebissen hat.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //Du willst mir nicht erzählen, wo du herkommst? Okay - dann sollen dich die Snapper holen!
	
	AI_StopProcessInfos (self);
};

func void DIA_Bilgot_HALLO_Burg ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //Ja, ich komme aus der Burg - warum?
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //Wie ist denn die Lage dort?
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //Nicht besser als hier. Die Orks sind noch da, wenn du das meinst.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //Verdammt. Nirgends ist man hier sicher.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //Ich sag dir was. Wenn ich nicht so viel Schiss hätte, würde ich einfach abhauen.
	
	Info_ClearChoices	(DIA_Bilgot_HALLO);
};
///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Job		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  3;
	condition	 = 	DIA_Bilgot_Job_Condition;
	information	 = 	DIA_Bilgot_Job_Info;
	permanent 	 =  FALSE;
	description	 = 	"Was machst du hier eigentlich? ";
};
func int DIA_Bilgot_Job_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_Job_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Job_15_00"); //Was machst du hier eigentlich?
	AI_Output (self, other, "DIA_Bilgot_Job_05_01"); //Ich bin hier das Mädchen für alles. Sachen durch die Gegend schleppen, Snapper beobachten, Bilgot hier, Bilgot da.
	AI_Output (self, other, "DIA_Bilgot_Job_05_02"); //Wär ich bloß zu Hause bei meiner Alten geblieben. Da war's zwar auch nicht anders, aber wenigsten gab's da ordentlich zu essen.
	AI_Output (self, other, "DIA_Bilgot_Job_05_03"); //Und nun bin ich der schäbige Rest von Waffenknechten, die Fajeth zugeteilt worden sind.
	AI_Output (self, other, "DIA_Bilgot_Job_05_04"); //Konnte ja nicht wissen, dass es eine Expedition ohne Rückkehr wird.
	AI_Output (self, other, "DIA_Bilgot_Job_05_05"); //Mein Kumpel Olav hat sich aus dem Staub gemacht. Vielleicht hat ER es ja geschafft ...
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Hilfe		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  3;
	condition	 = 	DIA_Bilgot_Hilfe_Condition;
	information	 = 	DIA_Bilgot_Hilfe_Info;
	permanent 	 =  FALSE;
	description	 = 	"Was weißt du über die Snapper?";
};
func int DIA_Bilgot_Hilfe_Condition ()
{
	if	(MIS_Fajeth_Kill_Snapper == LOG_RUNNING)	
	{
		return TRUE;
	};
};
func void DIA_Bilgot_Hilfe_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_00"); //Was weißt du über die Snapper?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_01"); //Warum willst du das wissen? Und erzähl mir nicht, du bist nur neugierig!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_02"); //Ich werde diese Snapper jagen.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_03"); //Das ist Wahnsinn. Ich habe sie beobachtet - das sind blutrünstige Bestien.
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_04"); //Dann sag mir, was du über sie weißt.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_05"); //Hm ... ich könnte dir schon helfen - aber nur unter einer Bedingung!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_06"); //Was willst du?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_07"); //Wenn du es schaffst, die Snapper zu töten - dann musst du mich hier rausbringen!
	
	if ((Npc_IsDead (Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Bilgot_Hilfe_05_08"); //Ich halte das hier nicht länger aus - hast du schon mal Fed gesprochen? Der Typ ist fertig - und ich will nicht so wie er werden!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info KnowsLeadSnapper
///////////////////////////////////////////////////////////////////////

instance DIA_Bilgot_KNOWSLEADSNAPPER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  4;
	condition	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	permanent 	 =  FALSE;
	description	 = 	"Erzähl mir, was du weißt. Dann hole ich dich hier raus!";
};

func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_Hilfe))
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //Erzähl mir, was du weißt. Dann hole ich dich hier raus!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //Ich wusste, ich kann auf dich zählen. Also pass auf. Ich habe die Snapper schon eine ganze Weile beobachtet.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //Sie sind sehr gerissen und haben eine Art ... Verständigung. Sie gehen niemals alleine und greifen nur in Rudeln an.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //Aber da ist noch etwas. Unter ihnen ist eine Echse, die ist anders. Sie tritt selten in Erscheinung - aber ich hab sie gesehen.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //Die anderen Viecher erniedrigen sich vor ihr, wenn sie vorbeigeht - aber halten sie dabei immer im Blick.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //Keine Echse in ihrer Nähe bewegt sich, wenn sie sich nicht bewegt.
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //Wo finde ich dieses Mistvieh?
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //Ich hab es beim Aufgang zu dem alten Wachturm gesehen.

	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //Gut. Ich denke, ich habe verstanden. Danke!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //Denk dran, du hast mir dein Wort gegeben!

	Wld_InsertNpc (NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01"); //Der Rudelführer
	
	B_LogEntry (TOPIC_FajethKillSnapper,"Bilgot hat mir von einem Rudelführer der Snapper berichtet. Er hält sich am Aufgang zum alten Wachturm auf."); 
	
	Log_CreateTopic (TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BilgotEscort,LOG_RUNNING);
	B_LogEntry (TOPIC_BilgotEscort,"Bilgot will, das ich ihn aus dem Tal bringe.");
		
};
///////////////////////////////////////////////////////////////////////
//	Info TakeYouWithMe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_TAKEYOUWITHME		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  2;
	condition	 = 	DIA_Bilgot_TAKEYOUWITHME_Condition;
	information	 = 	DIA_Bilgot_TAKEYOUWITHME_Info;
	permanent 	 =  FALSE;
	description	 = 	"(Versprechen einlösen)";
};
func int DIA_Bilgot_TAKEYOUWITHME_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
 	&& Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER)
 			{
				return TRUE;
 			};
};
func void DIA_Bilgot_TAKEYOUWITHME_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //Es ist Zeit, Bilgot! Pack deine Sachen. Wir ziehen ab.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_01"); //Großartig! Es reicht mir schon, wenn du mich über die große Brücke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_02"); //Dann beeil dich!
	AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_03"); //Bin schon fertig.

	Npc_ExchangeRoutine	(self, "FOLLOWTOOCBRIDGE");
	Bilgot.flags	= 0;	
	MIS_RescueBilgot = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info LaufSchneller
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LAUFSCHNELLER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  5;
	condition	 = 	DIA_Bilgot_LAUFSCHNELLER_Condition;
	information	 = 	DIA_Bilgot_LAUFSCHNELLER_Info;
	permanent	 =  FALSE;
	description	 = 	"Kannst du nicht ein bisschen schneller laufen?!";
};

func int DIA_Bilgot_LAUFSCHNELLER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_TAKEYOUWITHME))
	&& ((Npc_KnowsInfo(other, DIA_Bilgot_BEIBRUECKEANGEKOMMEN))==FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LAUFSCHNELLER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //Kannst du nicht ein bisschen schneller laufen?!
	AI_Output (self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //Ich mach ja, was ich kann.
};
///////////////////////////////////////////////////////////////////////
//	Info BeiBrueckeAngekommen
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_BEIBRUECKEANGEKOMMEN		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<8000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //So, da sind wir. Jetzt mach, dass du weg kommst. Die Gegend ist heiß!
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //Ich danke dir!
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //Lass dich nicht fressen. Wär schade drum.
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03"); //Leb wohl!
	
	AI_StopProcessInfos (self);	
	TschuessBilgot = TRUE;
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP (XP_BilgotEscort);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self, "FLEEOUTOFOW");
};
///////////////////////////////////////////////////////////////////////
//	Info LetztePause
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LetztePause		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_LetztePause_Condition;
	information	 = 	DIA_Bilgot_LetztePause_Info;
	permanent	 = 	TRUE;
	description	 = 	"Was machst du hier? Ich dachte, du wolltest über den Pass? ";
};

func int DIA_Bilgot_LetztePause_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<1000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LetztePause_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_00"); //Was machst du hier? Ich dachte, du wolltest über den Pass?
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_01"); //Ich kann einfach nicht mehr! Lass mich nur einen Moment ausruhen. Ich komm schon klar! Mach dir keine Sorgen!
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_02"); //Wie du willst.
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_03"); //Nur eine kleine Pause.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Olav
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Olav		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_Olav_Condition;
	information	 = 	DIA_Bilgot_Olav_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ich habe Olav gefunden.";
};

func int DIA_Bilgot_Olav_Condition ()
{
	if (Npc_HasItems (Olav, ITSE_Olav) == 0)	
	&& (Npc_KnowsInfo (other,DIA_Bilgot_Job))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Olav_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Olav_15_00"); //Ich habe Olav gefunden.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_01"); //Und wo treibt er sich rum?
	AI_Output (other, self, "DIA_Bilgot_Olav_15_02"); //Er ist tot. Die Wölfe haben ihn gefressen.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_03"); //Oh verdammt. Hoffentlich schaff ich es wenigstens, hier rauszukommen!
	
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bilgot_PICKPOCKET (C_INFO)
{
	npc			= VLK_4120_Bilgot;
	nr			= 900;
	condition	= DIA_Bilgot_PICKPOCKET_Condition;
	information	= DIA_Bilgot_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Bilgot_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Bilgot_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bilgot_PICKPOCKET);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_BACK 		,DIA_Bilgot_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bilgot_PICKPOCKET_DoIt);
};

func void DIA_Bilgot_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};
	
func void DIA_Bilgot_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};



