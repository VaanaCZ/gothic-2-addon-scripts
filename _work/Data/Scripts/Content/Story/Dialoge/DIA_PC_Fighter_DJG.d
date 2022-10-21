
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornDJG_EXIT(C_INFO)
{
	npc		= PC_Fighter_DJG;
	nr		= 999;
	condition	= DIA_GornDJG_EXIT_Condition;
	information	= DIA_GornDJG_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornDJG_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_STARTCAMP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_STARTCAMP_Condition;
	information	 = 	DIA_GornDJG_STARTCAMP_Info;

	description	 = 	"Wie ich sehe, hast du dich den Drachenjägern angeschlossen.";
};

func int DIA_GornDJG_STARTCAMP_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_STARTCAMP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //Wie ich sehe, hast du dich den Drachenjägern angeschlossen.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //Ich bin Sylvio ins Minental gefolgt, weil ich mich hier einfach am besten auskenne und mir die Situation hier nochmal genauer ansehen wollte.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //Ich sag dir was. Hier braut sich ganz schön was zusammen. Ich habe in meinem ganzen Leben noch nicht so viele Orks auf einem Haufen gesehen.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //Würde mich nicht wundern, wenn Garond und die Paladine in der Burg schon längst alle geflohen sind oder getötet wurden.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Ich sehe dich dann.", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Was hast du jetzt vor?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //Was hast du jetzt vor?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //Ich werde erstmal den Jungs hier ins Minental folgen und mich dann später absetzen.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //Ich muss unbedingt herauskriegen, was die Orks vorhaben.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //Ich sehe dich dann.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //Pass auf dich auf.
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HALLO		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HALLO_Condition;
	information	 = 	DIA_GornDJG_HALLO_Info;

	description	 = 	"Hier hast du dich also verkrochen!";
};

func int DIA_GornDJG_HALLO_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1500) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //Hier hast du dich also verkrochen!
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //Du bist auch nicht klein zu kriegen, was?

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"Hast du schon Beute gemacht?";
};

func int DIA_GornDJG_WHATSUP_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATSUP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //Hast du schon Beute gemacht?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //Ich warte noch. Ich habe den Eindruck, dass da oben in der alten Felsenruine was zu holen ist. Nachts brennen dort Lichter und ich kann Schreie hören.

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Vielleicht Lester?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Ein Drache?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"Gorn sitzt am Fuße der Hochebene zur alten Felsenfestung. Von dort aus hat er sowohl die Hochebene als auch die Orkbarriere im Blickfeld."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //Vielleicht ist es Lester, der in seine alte Felsruine zurückgekehrt ist?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //Kann nicht sein. Soviel ich weiß, wohnt Lester dort oben nicht mehr!
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //Ein Drache?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //Höchstwahrscheinlich. Die Hochebene da oben wird bewacht wie die verdammte Schatzkammer des Königs. Leider ist das der einzige Weg zur Festung.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //Als ob die Drachen noch nicht schlimm genug wären. Sie haben anscheinend noch einige weitere Unholde im Schlepptau.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"Laut Gorn haust ein Drache in der alten Felsenfestung."); 
	
	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
};

///////////////////////////////////////////////////////////////////////
//	Info WhatMonsters
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATMONSTERS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATMONSTERS_Condition;
	information	 = 	DIA_GornDJG_WHATMONSTERS_Info;

	description	 = 	"Was für Unholde sollen das sein?";
};

func int DIA_GornDJG_WHATMONSTERS_Condition ()
{
	if (GornDJG_WhatMonsters == TRUE)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATMONSTERS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //Was für Unholde sollen das sein?
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //Ich hab sie noch nicht richtig erkennen können, aber sie sind aufrecht gehende Wesen mit schuppiger Haut. Sie streifen über die Felsen, wie Snapper, die eine Beute gewittert haben.
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //Ich kann sie hier unten schnüffeln und schnauben hören. Ich glaube, sie haben die ganze Ebene da oben in Beschlag genommen.

};


///////////////////////////////////////////////////////////////////////
//	Info WahtAboutOrcs
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WAHTABOUTORCS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WAHTABOUTORCS_Condition;
	information	 = 	DIA_GornDJG_WAHTABOUTORCS_Info;

	description	 = 	"Was ist mit den Orks?";
};

func int DIA_GornDJG_WAHTABOUTORCS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_00"); //Was ist mit den Orks?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //Ich beobachte sie schon eine ganze Weile. Die Barrikade, die sie da unten errichtet haben, soll irgendwas verbergen. Ich vermute, es haben sich schon Massen von Ihnen dahinter versammelt.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //Du meinst, NOCH mehr als ohnehin schon hier sind?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //Würde mich nicht wundern, wenn sie eines Abends ihre Palisaden abreißen, in Scharen über den Pass marschieren und das ganze Land überschwemmen. Ich hab kein gutes Gefühl bei dem Ding.
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //Wenn das passiert, muss ich zurück und Lee warnen. Er will ohnehin von der Insel verschwinden. Spätestens dann wird's Zeit, Mann!

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"Kannst du mir helfen, in die Festung zu kommen?";
};

func int DIA_GornDJG_HELPKILLDRACONIANS_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATMONSTERS))
		&& (Npc_KnowsInfo(other, DIA_GornDJG_WAHTABOUTORCS))
		&& ((Npc_IsDead(RockDragon))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //Kannst du mir helfen, in die Festung zu kommen?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //Ich weiß nicht so recht. Ich habe Angst, dass die Orks genau in dem Moment los schlagen, wenn ich gerade nicht hinsehe.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //Das ist Paranoia!
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //Kann's nicht ändern. Ich würde es mir nie verzeihen, wenn ich zu spät käme, verstehst du? Andererseits ...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //Was soll's! Wozu bin ich hierher gekommen? Lass uns die Ebene stürmen und den Weg zur Festung frei kämpfen.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //Ein bisschen Bewegung kann nicht schaden. Außerdem will ich mir die Biester da oben mal aus der Nähe ansehen.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //Sag Bescheid, wenn's los geht!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn will mir helfen zur Felsenfestung über die Hochebene zu kommen."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht´s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"Lass uns angreifen!";
};

func int DIA_GornDJG_LOSGEHTS_Condition ()
{
if (Npc_KnowsInfo(other, DIA_GornDJG_HELPKILLDRACONIANS))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_LOSGEHTS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //Lass uns angreifen!
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //Wie in alten Zeiten, was? Aber ich sag dir was: Das wird meine Schlacht. Diesmal werde ich voran gehen!

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"RunToRockRuinBridge"); 
};




///////////////////////////////////////////////////////////////////////
//	Info BisHierhin
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_BISHIERHIN		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_BISHIERHIN_Condition;
	information	 = 	DIA_GornDJG_BISHIERHIN_Info;
	important	 = 	TRUE;
};

func int DIA_GornDJG_BISHIERHIN_Condition ()
{
	if (Npc_GetDistToWP(self,"LOCATION_19_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_BISHIERHIN_Info ()
{
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //War ja ein Kinderspiel. So, mein Freund, den Rest musst du allein erledigen. Heiz ihnen ordentlich ein! Ich werde zurückgehen, die Orks im Auge behalten.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //Kein Problem. Ich seh dich!
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //Hoffentlich!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn ging wieder zu seinem Ausichtsplatz zurück. Er will die Orks weiter beobachten."); 

	B_GivePlayerXP (XP_GornDJGPlateauClear);
 	
 	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info DragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_DRAGONDEAD		(C_INFO)
{
	npc		 	 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_DRAGONDEAD_Condition;
	information	 = 	DIA_GornDJG_DRAGONDEAD_Info;

	description	 = 	"Der Felsdrache ist tot!";	
};

func int DIA_GornDJG_DRAGONDEAD_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATSUP))
		&& (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1000)
		&&  ((Npc_IsDead(RockDragon))== TRUE)
		)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_DRAGONDEAD_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //Der Felsdrache ist tot!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //Ich hör die Schreie nicht mehr! Warst du oben in der Felsenfestung?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //Ja!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //Haha! Hab ich es mir doch gedacht. Wo du auftauchst bleibt kein Stein auf dem anderen.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //Was willst du jetzt machen?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //Ich bleib noch eine Weile und mach mich dann auf den Weg zurück zu Lee. Vielleicht treffen wir uns da ja wieder!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //Ich kann diese verdammte Gegend bald nicht mehr sehen. Es wird Zeit, dass wir aus diesem Land endlich verschwinden.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_07"); //Bis dann!
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_DJG_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_DJG;
	nr			= 900;
	condition	= DIA_Fighter_DJG_PICKPOCKET_Condition;
	information	= DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	C_Beklauen (10, 35);
};
 
FUNC VOID DIA_Fighter_DJG_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};
	
func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};











