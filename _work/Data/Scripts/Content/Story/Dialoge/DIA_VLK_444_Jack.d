///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jack_EXIT   (C_INFO)
{
	npc         = VLK_444_Jack;
	nr          = 999;
	condition   = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jack_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jack_PICKPOCKET (C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 900;
	condition	= DIA_Jack_PICKPOCKET_Condition;
	information	= DIA_Jack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jack_PICKPOCKET_Condition()
{
	C_Beklauen (50, 100);
};
 
FUNC VOID DIA_Jack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jack_PICKPOCKET);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_BACK 		,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
	
func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_GREET		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	4;
	condition	 = 	DIA_Jack_GREET_Condition;
	information	 = 	DIA_Jack_GREET_Info;
	important 	 =  TRUE; 

};

func int DIA_Jack_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Jack_GREET_Info ()
{
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //Ahoi, du Landratte, bist wohl hier gestrandet, was?
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //Siehst'n bisschen blass aus um die Nase.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Mach dir nichts draus, mein Jung, 'ne Steife Brise vom Meer und das wird schon wieder.
};


///////////////////////////////////////////////////////////////////////
//	Was machst Du hier
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Job		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	5;
	condition	 = 	DIA_Jack_Job_Condition;
	information	 = 	DIA_Jack_Job_Info;

	description	 = 	"Was machst Du hier?";
};

func int DIA_Jack_Job_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_GREET)
	{
		return TRUE;
	};
};
func void DIA_Jack_Job_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //Was machst du hier?
	AI_Output			(self, other, "DIA_Jack_Job_14_01"); //Damals, als junger Mann, bin ich noch zur See gefahren und habe so manchen großen Sturm miterlebt.
	AI_Output			(self, other, "DIA_Jack_Job_14_02"); //Vor vielen Jahren hab ich mich dann hier nieder gelassen und war lange Zeit Leuchtturmwärter von Khorinis.
	AI_Output			(self, other, "DIA_Jack_Job_14_03"); //Keine aufregende Sache. Wirklich nicht. Aber dieser alte Turm kam dem, was man ein Zuhause nennt, am Nächsten.
	AI_Output			(self, other, "DIA_Jack_Job_14_04"); //Bin schon ziemlich lange nicht mehr oben gewesen.
	AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Warum nicht?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Seit diese Bengel in meinem Leuchtturm hausen, hab ich mich keine zwanzig Schritt mehr ran getraut. Ganz übles Pack.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Das sind Verbrecher aus dem Minental, musst du wissen.
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //Es gab diesen großen Knall jenseits der Berge und dann sind sie wie die Fliegen über das Land gekommen. Jetzt verkriechen sie sich überall. Auch in meinem Turm.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //Ich glaube, die halten bestimmt nach einem Schiff Ausschau, das sie überfallen können.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //Eh. Sollen sie doch. Dann wär'n sie wenigstens raus aus meinem Turm.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"Der alte Seemann Jack kann nicht in seinen alten Leuchtturm zurück, solange dort die Bandíten hausen."); 
	
	MIS_Jack_KillLighthouseBandits = LOG_RUNNING;
	
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_City		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	6;
	condition	 = 	DIA_Jack_City_Condition;
	information	 = 	DIA_Jack_City_Info;

	description	 = 	"Bist du oft in der Stadt?";
};

func int DIA_Jack_City_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_Job)
	{
		return TRUE;
	};
};
func void DIA_Jack_City_Info ()
{
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //Bist du oft in der Stadt?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //Ich sag immer, eine Stadt ist nur so gut wie ihr Hafen.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //Der Hafen ist das Tor zur Welt. Da trifft sich alles, und von dort geht alles aus.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Wenn der Hafen vor die Hunde geht, wird der Rest der Stadt bald folgen.
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über den Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Harbor		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	70;
	condition	 = 	DIA_Jack_Harbor_Condition;
	information	 = 	DIA_Jack_Harbor_Info;
	permanent	 =  TRUE;

	description	 = 	"Erzähl mir was über den Hafen.";
};

func int DIA_Jack_Harbor_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_City)
		&&	((Npc_GetDistToWP(self,"LIGHTHOUSE")< 3000) == FALSE)
		&& 	(JackIsCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jack_Harbor_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Harbor_15_00"); //Erzähl mir was über den Hafen.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //Der Hafen von Khorinis ist nicht mehr das, was er mal war.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //Hier treibt sich nur noch Gesindel rum, die Schiffe kommen nicht mehr, und der Handel ist tot. Der Hafen, der ist kaputt.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"Warum kommen keine Schiffe mehr?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"Was meinst Du mit Gesindel?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"Warum gehst du dann nicht?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //Warum kommen keine Schiffe mehr?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //Alle sagen, wenn der Krieg vorbei ist, wird alles wieder wie früher. Das ist alles Schiet.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //Ich sag dir, ein Seemann, der merkt, wenn es mit der Stadt bergab geht.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //Ein Seemann hat so was im Blut. Und ich sage dir, mit diesem Hafen ist nix mehr los, der hat ausgedient.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //Was meinst du mit Gesindel?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Seh sie dir an, dieses faule Pack. Die meisten wissen gar nicht mehr, was Arbeit ist. Die saufen den ganzen Tag und verhuren ihre letzte Heuer.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //Ich sach dir, halt dich von denen fern.
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //Warum gehst du dann nicht?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //Einen alten Seebär wie mich nimmt doch keiner mehr auf sein Schiff.
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //Die Meisten denken doch dem Alten Jack ist die Gicht in die morschen Knochen gefahren.
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_03"); //Und? Haben sie Recht?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_04"); //Erzähl kein Unsinn. Wenn ich erst wieder Planken unter den Füßen habe, dann fühle ich mich wie ein junger Hüpfer.
};

///////////////////////////////////////////////////////////////////////
//	Info BanditenWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BANDITENWEG		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	7;
	condition	 = 	DIA_Jack_BANDITENWEG_Condition;
	information	 = 	DIA_Jack_BANDITENWEG_Info;

	description	 = 	"Die Banditen, die in deinem Leuchtturm hausten, sind weg.";
};

func int DIA_Jack_BANDITENWEG_Condition ()
{
	if (Npc_IsDead(LeuchtturmBandit_1021))
		&& (Npc_IsDead(LeuchtturmBandit_1022))
		&& (Npc_IsDead(LeuchtturmBandit_1023))
		&& (MIS_Jack_KillLighthouseBandits == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Jack_BANDITENWEG_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //Die Banditen, die in deinem Leuchtturm hausten, sind weg.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //Ist das wirklich war? Endlich kann ich wieder meine Arbeit aufnehmen.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //Komm doch mit. Von meinem Turm aus haste 'nen unvergleichlichen Ausblick aufs Meer.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillLighthouseBandits);
};

///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	8;
	condition	 = 	DIA_Jack_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"Netten Turm hast du.";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"LIGHTHOUSE")<3000) 
		&& (MIS_SCKnowsWayToIrdorath == FALSE) 
		{
				return TRUE;
		};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //Netten Turm hast du.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //Nicht wahr? Geh ruhig ganz nach oben und sieh dir den schönen Ausblick an, mein Jung. Fühl dich hier wie Zuhause.
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

INSTANCE DIA_Jack_KAP3_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP3_EXIT_Condition;
	information	= DIA_Jack_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP3_EXIT_Info()
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

INSTANCE DIA_Jack_KAP4_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP4_EXIT_Condition;
	information	= DIA_Jack_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP4_EXIT_Info()
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

INSTANCE DIA_Jack_KAP5_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP5_EXIT_Condition;
	information	= DIA_Jack_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	51;
	condition	 = 	DIA_Jack_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Hättest du nicht Lust, wieder zur See zu fahren?";
};

func int DIA_Jack_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&& (MIS_Jack_NewLighthouseOfficer == 0)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //Hättest du nicht Lust, wieder zur See zu fahren?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Ich würde meinen rechten Arm hergeben, um noch mal auf einem großen Schoner anheuern zu können.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Aber für so 'nen alten Knebbel wie mich ist das nicht mehr so einfach, mein Jung. Außerdem, wer würde sich um den Leuchtturm kümmern?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Schon gut. War nur so eine Idee.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Ich brauche deine Erfahrung als Seemann.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //Ich brauche deine Erfahrung als Seemann.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //Potzblitz. Was hast du vor, mein Jung? Du willst doch nicht etwa die Kriegsgaleere des Königs entern, oder?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //Wer weiß?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //(lacht) Das wär ja was. Na schön. Aber meinen Leuchtturm werde ich nicht so einfach aufgeben. Mmh. Was machen wir denn da?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Jack, der alte Seemann aus dem Hafen wäre ein guter Kapitän. Allerdings müsste ich ihm vorher eine Vertretung für seinen Leuchturm suchen."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Schon gut. War nur so eine Idee.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Was wäre, wenn ich dir jemanden bringe...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //Was wäre, wenn ich dir jemanden bringe, der in der Zwischenzeit auf deinen Turm achtet?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //Gar keine so schlechte Idee. Ich wüsste da auch schon jemanden.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Harad, der Schmied, hat einen Lehrling. Der heißt Brian. Ich hab mich schon oft mit ihm unterhalten.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //Ich würde ihm gerne meinen Turm anvertrauen. Ich glaube, er wäre genau der richtige dafür.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //Sprich mal mit ihm. Vielleicht haben wir Glück und der Junge wird uns helfen.
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};


func void DIA_Jack_BEMYCAPTAIN_no ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //Schon gut. War nur so eine Idee.
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	52;
	condition	 = 	DIA_Jack_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN2_Info;

	description	 = 	"Wegen Brian...";
};

func int DIA_Jack_BEMYCAPTAIN2_Condition ()
{
	if 	((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		|| 	((MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	&& 	(Npc_IsDead(Brian))))
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN2_Info ()
{
	if (Npc_IsDead(Brian))
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //Brian ist tot.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //Oh. Schlimme Zeiten sind das. Und er war noch so ein netter Kerl.
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Brian wird ab jetzt auf deinen Leuchtturm achten.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //Ich hatte gehofft, dass du das sagen würdest.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //Brauchst du mich noch?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Mal sehen, ob der Junge was taugt.
			AI_StopProcessInfos (self);
			};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	53;
	condition	 = 	DIA_Jack_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN3_Info;

	description	 = 	"Sei mein Kapitän.";
};

func int DIA_Jack_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		&& (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //Sei mein Kapitän.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //Ich bin zwar schon weit rum gekommen, mein Jung, aber ich bin doch noch nie Kapitän von einem Schiff gewesen.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //Ich hab von Navigation keine Ahnung. Das wirst du übernehmen müssen.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Ich werde mein Bestes geben.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Dann zeig mir mal dein Schiff und deine Mannschaft. Weißt du denn schon, wo du hin willst? Ich meine, hast du eine Seekarte?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Warte auf mich im Hafen. Um den Rest mach dir keine Sorgen.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //Wie du meinst.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);        
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_LOSFAHREN_Condition;
	information	 = 	DIA_Jack_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"So, alter Mann. Lass uns in See stechen.";
};

func int DIA_Jack_LOSFAHREN_Condition ()
{
	if (JackIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jack_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LOSFAHREN_15_00"); //So, alter Mann. Lass uns in See stechen.

	if ((B_CaptainConditions (self)) == TRUE)
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //Alles im Lot, aufm Boot. Dann zeig mal her deine Seekarte.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //Das wird ja was geben. Hoffentlich kommen wir in einem Stück dort an.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //Hast du denn auch wirklich alles dabei? Wir werden nicht zurück segeln, nur weil dir noch etwas fehlt.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Wenn du dir sicher bist, dass du alles hast, dann geh in die Kapitänskajüte und leg dich erstmal schlafen. Du wirst es brauchen.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Langsam an, mein Jung. Ich hab mir den Kahn noch mal angesehen. So wird das nix.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //erstmal brauchst eine komplette Mannschaft von mindestens 5 Mann, freien Zugang zum Schiff und eine Seekarte. Sonst geht das nicht.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////

instance DIA_Jack_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wie soll's jetzt weiter gehen?";
};

func int DIA_Jack_PERM5_NOTCAPTAIN_Condition ()
{
		if	((Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JackIsCaptain == FALSE))
		|| 	(MIS_Jack_NewLighthouseOfficer == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Jack_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //Wie soll's jetzt weiter gehen?
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //Ich hab mir das noch mal durch den Kopf gehen lassen. Ich werde hier bei meinem Leuchtturm bleiben.
	
	AI_StopProcessInfos (self);
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


INSTANCE DIA_Jack_KAP6_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP6_EXIT_Condition;
	information	= DIA_Jack_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};










































 





















