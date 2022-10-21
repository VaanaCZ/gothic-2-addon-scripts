
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Godar_EXIT   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 999;
	condition   = DIA_Godar_EXIT_Condition;
	information = DIA_Godar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Godar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Godar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_Godar_Hello   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 4;
	condition   = DIA_Godar_Hello_Condition;
	information = DIA_Godar_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Godar_Hello_Condition()
{
	IF (Npc_IsInState (self,ZS_TALK))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Godar_Hello_Info()
{
	AI_Output (self ,other,"DIA_Godar_Hello_13_00"); //Häh? Was?
};

//*********************************************************************
//	Wo kommt ihr überhaupt her? 
//*********************************************************************
INSTANCE DIA_Godar_ComeFrom   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 4;
	condition   = DIA_Godar_ComeFrom_Condition;
	information = DIA_Godar_ComeFrom_Info;
	permanent   = FALSE;
	description	= "Wo kommt ihr her?";
};

FUNC INT DIA_Godar_ComeFrom_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Godar_ComeFrom_Info()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_15_00"); //Wo kommt ihr her?
	AI_Output (self ,other,"DIA_Godar_ComeFrom_13_01"); //Wir kommen aus den ...äh, sind aus der Stadt.
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"Ihr seid Banditen!",DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice (DIA_Godar_ComeFrom,"Wieso habe ich euch noch nie in der Stadt gesehen?",DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice (DIA_Godar_ComeFrom,"So so. Aus der Stadt also.",DIA_Godar_ComeFrom_Understand);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_15_00"); //Ihr seid Banditen!
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_13_01"); //Vorsicht! Du nimmst den Mund ganz schön voll!
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"Entspann dich. Ich verpfeiff dich nicht.",DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice (DIA_Godar_ComeFrom,"Du kannst mir keine Angst machen.",DIA_Godar_ComeFrom_Bandits_NoFear);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits_KeepCalm ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00"); //Entspann dich. Ich verpfeife dich nicht.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01"); //Das will ich für dich hoffen. Ansonsten bist du tot!
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits_NoFear ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00"); //Du kannst mir keine Angst machen.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01"); //Das wollen wir doch mal sehen.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_15_00"); //Ich hab euch noch nie in der Stadt gesehen.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_13_01"); //Ich kann Leute nicht leiden, die ihre Nasen in Dinge stecken, die sie nichts angehen, verstanden?
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"Nö.",DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice (DIA_Godar_ComeFrom,"Verstanden, ihr kommt aus der Stadt.",DIA_Godar_ComeFrom_NotCity_Forget);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity_Forget ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_Forget_15_00"); //Verstanden, ihr kommt aus der Stadt.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01"); //Ganz genau.

	Info_ClearChoices (DIA_Godar_ComeFrom);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity_CutThroat ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00"); //Nö.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01"); //Dann werd ich's dir reinprügeln müssen.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Godar_ComeFrom_Understand ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Understand_15_00"); //So so. Aus der Stadt also.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Understand_13_01"); //Siehste! Haste's kapiert!
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Understand_13_02"); //Hier nimm erstmal 'nen Schluck!
	
	CreateInvItems (self,ItFo_Beer,1);
	B_GiveInvItems (self,other,ItFo_Beer,1);
	B_UseItem (other,ItFo_Beer);
	Info_ClearChoices (DIA_Godar_ComeFrom);
};

//*********************************************************************
//	Was macht ihr hier? 
//*********************************************************************
INSTANCE DIA_Godar_Plan   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 5;
	condition   = DIA_Godar_Plan_Condition;
	information = DIA_Godar_Plan_Info;
	permanent   = FALSE;
	description	= "Was macht ihr hier?";
};

FUNC INT DIA_Godar_Plan_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Godar_Plan_Info()
{
	AI_Output (other,self ,"DIA_Godar_Plan_15_00"); //Was macht ihr hier?
	AI_Output (self ,other,"DIA_Godar_Plan_13_01"); //Wir haben von der Drachenjagd gehört. Also haben wir unsere Sachen gepackt und sind hierher gekommen.
	AI_Output (self ,other,"DIA_Godar_Plan_13_02"); //Aber um ehrlich zu sein, sind mir die Drachen scheißegal. Ich will nur ein bisschen Gold.
	AI_Output (self ,other,"DIA_Godar_Plan_13_03"); //Drachen haben doch Gold, oder?
	AI_Output (other,self ,"DIA_Godar_Plan_15_04"); //Bestimmt.
};

//*********************************************************************
//	Wisst ihr was über die Drachen? 
//*********************************************************************
INSTANCE DIA_Godar_DragonLore   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 5;
	condition   = DIA_Godar_DragonLore_Condition;
	information = DIA_Godar_DragonLore_Info;
	permanent   = FALSE;
	description	= "Was weißt du über die Drachen?";
};

FUNC INT DIA_Godar_DragonLore_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Godar_Plan))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Godar_DragonLore_Info()
{
	AI_Output (other,self ,"DIA_Godar_DragonLore_15_00"); //Was weißt du über die Drachen?
	AI_Output (self ,other,"DIA_Godar_DragonLore_13_01"); //Ich kenn nur die Geschichten, die man den Kindern erzählt.
	AI_Output (self ,other,"DIA_Godar_DragonLore_13_02"); //Du weißt schon, Jungfrauen, Gold, Feuerspucken und so'n Zeug.
};

//*********************************************************************
//	Wo wollt ihr hin?
//*********************************************************************
INSTANCE DIA_Godar_Destination   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 5;
	condition   = DIA_Godar_Destination_Condition;
	information = DIA_Godar_Destination_Info;
	permanent   = FALSE;
	description	= "Wo wollt ihr von hier aus hin?";
};

FUNC INT DIA_Godar_Destination_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Godar_Plan))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Godar_Destination_Info()
{
	AI_Output (other,self ,"DIA_Godar_Destination_15_00"); //Wo wollt ihr von hier aus hin?
	AI_Output (self ,other,"DIA_Godar_Destination_13_01"); //Keine Ahnung. Wir überlegen noch.
	
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
		{
			AI_Output (other,self ,"DIA_Godar_Destination_15_02"); //Ihr könntet in die Burg gehen.
			AI_Output (self ,other,"DIA_Godar_Destination_13_03"); //Da bringen mich keine 10 Pferde rein. Nicht zu den Paladinen.
			AI_Output (self ,other,"DIA_Godar_Destination_13_04"); //Ich geh nicht zurück in den Knast. Ich war einmal drin, das reicht mir.
		};
};

//*********************************************************************
//	Was ist mit den Orks?
//*********************************************************************
INSTANCE DIA_Godar_Orks   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 5;
	condition   = DIA_Godar_Orks_Condition;
	information = DIA_Godar_Orks_Info;
	permanent   = FALSE;
	description	= "Was ist mit den Orks?";
};

FUNC INT DIA_Godar_Orks_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Godar_Destination))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Godar_Orks_Info()
{
	AI_Output (other,self ,"DIA_Godar_Orks_15_00"); //Was ist mit den Orks?
	AI_Output (self ,other,"DIA_Godar_Orks_13_01"); //Die ganze Burg ist umstellt. Es gibt keine Lücken.
	AI_Output (self ,other,"DIA_Godar_Orks_13_02"); //Sich da durch zu schleichen ist Wahnsinn. Wenn du versuchst, zu kämpfen, kannst du dich gleich begraben lassen.
	AI_Output (self ,other,"DIA_Godar_Orks_13_03"); //Niemand kommt da durch.
	AI_Output (other,self ,"DIA_Godar_Orks_15_04"); //So so.
};

//*********************************************************************
//	Weswegen warst du im Knast?
//*********************************************************************
INSTANCE DIA_Godar_Prison   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 5;
	condition   = DIA_Godar_Prison_Condition;
	information = DIA_Godar_Prison_Info;
	permanent   = FALSE;
	description	= "Weswegen warst du im Knast?";
};

FUNC INT DIA_Godar_Prison_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Godar_Destination))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Godar_Prison_Info()
{
	AI_Output (other,self ,"DIA_Godar_Prison_15_00"); //Weswegen warst du im Knast?

	if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Godar_Prison_13_01"); //Das werde ich dir auch auf die Nase binden, was?
			AI_Output (self ,other,"DIA_Godar_Prison_13_02"); //Ihr Magier steckt doch mit den Paladinen unter einer Decke. Ne, mein Lieber. Vergiss es.
		}
	else
		{		
			AI_Output (self ,other,"DIA_Godar_Prison_13_03"); //Die Schweine haben mich wegen Wilderei dran gekriegt. Wegen zwei lumpigen Hasen!
			AI_Output (self ,other,"DIA_Godar_Prison_13_04"); //10 Jahre haben sie mir dafür aufgebrummt.
			AI_Output (other,self ,"DIA_Godar_Prison_15_05"); //Das war alles?
			AI_Output (self ,other,"DIA_Godar_Prison_13_06"); //Na gut, ich hab mich natürlich gewehrt.
			AI_Output (other,self ,"DIA_Godar_Prison_15_07"); //Und?
			AI_Output (self ,other,"DIA_Godar_Prison_13_08"); //Ich konnte nichts dafür, der Typ ist gestolpert und hat sich sein Genick gebrochen. Ehrlich!
			
			Info_ClearChoices (DIA_Godar_Prison);
			Info_AddChoice (DIA_Godar_Prison,"Kommt mir bekannt vor.",DIA_Godar_Prison_Court);
			Info_AddChoice (DIA_Godar_Prison,"Was lässt du dich auch erwischen?",DIA_Godar_Prison_Pissoff);
		};
};

FUNC VOID DIA_Godar_Prison_Court ()
{
	AI_Output (other,self ,"DIA_Godar_Prison_Court_15_00"); //Kommt mir bekannt vor.
	AI_Output (self ,other,"DIA_Godar_Prison_Court_13_01"); //Du verstehst mich. Die reichen Säcke wissen gar nicht, wie wir behandelt werden.
	AI_Output (self ,other,"DIA_Godar_Prison_Court_13_02"); //Das kümmert die überhaupt nicht.
	
	Info_ClearChoices (DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

FUNC VOID DIA_Godar_Prison_Pissoff ()
{
	AI_Output (other,self ,"DIA_Godar_Prison_Pissoff_15_00"); //Was lässt du dich auch erwischen?
	AI_Output (self ,other,"DIA_Godar_Prison_Pissoff_13_01"); //(verärgert) Ich wette, du hast noch nie im Knast gesessen, oder?
	AI_Output (self ,other,"DIA_Godar_Prison_Pissoff_13_02"); //Dann sollte ich dir mal eine Lektion erteilen, was einem so alles im Knast passieren kann.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

//*********************************************************************
//	Kannst du mir beibringen wie man jagt?
//*********************************************************************
INSTANCE DIA_Godar_Hunting   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 5;
	condition   = DIA_Godar_Hunting_Condition;
	information = DIA_Godar_Hunting_Info;
	permanent   = FALSE;
	description	= "Kannst du mir beibringen, wie man jagt?";
};

FUNC INT DIA_Godar_Hunting_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Godar_Prison))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Godar_Hunting_Info()
{
	AI_Output (other,self ,"DIA_Godar_Hunting_15_00"); //Kannst du mir beibringen, wie man jagt?
	if (GodarLikesYou == FALSE)
	{
		AI_Output (self ,other,"DIA_Godar_Hunting_13_01"); //Das ist nicht dein Ernst, oder? Verschwinde!
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Godar_Hunting_13_03"); //Ein Tier hat mehr als nur Fleisch. Du kannst die Felle oder Krallen verkaufen. Das kann ein ganz schönes Sümmchen einbringen.
		AI_Output (self ,other,"DIA_Godar_Hunting_13_04"); //Ich kann es kaum erwarten, einen Drachen in die Finger zu bekommen.
		
		Godar_TeachAnimalTrophy = TRUE;
	};	
};

//*********************************************************************
// 	Dragonstuff
//*********************************************************************
INSTANCE DIA_Godar_Dragonstuff   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 5;
	condition   = DIA_Godar_Dragonstuff_Condition;
	information = DIA_Godar_Dragonstuff_Info;
	permanent   = TRUE;
	description	= "Zeig mir das Ausnehmen von Drachen.";
};
var int Godar_TeachDragonStuff;
FUNC INT DIA_Godar_Dragonstuff_Condition()
{
	if (Godar_TeachAnimalTrophy == TRUE)
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	&& ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE))
	&& (Godar_TeachDragonStuff == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Godar_Dragonstuff_Info()
{
	AI_Output (other,self ,"DIA_Godar_Dragonstuff_15_00"); //Zeig mir das Ausnehmen von Drachen.
	
	AI_Output (self,other ,"DIA_Godar_Dragonstuff_13_01"); //Damit du die Kohle ganz allein scheffeln kannst, was?
	
	AI_Output (self,other ,"DIA_Godar_Dragonstuff_13_02"); //Na gut, aber das kostet dich 1000 Goldmünzen.

	Info_ClearChoices	(DIA_Godar_Dragonstuff);	
	Info_AddChoice	(DIA_Godar_Dragonstuff, "Das ist mir die Sache nicht wert.", DIA_Godar_Dragonstuff_nein );
	Info_AddChoice	(DIA_Godar_Dragonstuff, "Das ist fair.", DIA_Godar_Dragonstuff_fair );

};
func void DIA_Godar_Dragonstuff_fair ()
{
	AI_Output			(other, self, "DIA_Godar_Dragonstuff_fair_15_00"); //Das ist fair.

		if (B_GiveInvItems (other, self, ItMi_Gold,1000))
		{
			Godar_TeachDragonStuff = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Godar_Dragonstuff_fair_13_01"); //Ohne Geld ist es das nicht. Besorg dir erstmal die Kohle.
		};
	Info_ClearChoices	(DIA_Godar_Dragonstuff);	
};

func void DIA_Godar_Dragonstuff_nein ()
{
	AI_Output			(other, self, "DIA_Godar_Dragonstuff_nein_15_00"); //Das ist mir die Sache nicht wert.
	AI_Output			(self, other, "DIA_Godar_Dragonstuff_nein_13_01"); //Auch gut.
	Info_ClearChoices	(DIA_Godar_Dragonstuff);	

};

//*********************************************************************
//	Zeig mir wie man jagd.
//*********************************************************************
INSTANCE DIA_Godar_Teach   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 5;
	condition   = DIA_Godar_Teach_Condition;
	information = DIA_Godar_Teach_Info;
	permanent   = TRUE;
	description	= "Zeig mir, wie man jagt.";
};

FUNC INT DIA_Godar_Teach_Condition()
{
	if (Godar_TeachAnimalTrophy == TRUE)
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Godar_Teach_Info()
{
	AI_Output (other,self ,"DIA_Godar_Teach_15_00"); //Zeig mir, wie man jagt.
	if 	(
			(Npc_GetTalentSkill (other,NPC_TALENT_SNEAK) == FALSE) 
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
		)
		{
			Info_AddChoice (DIA_Godar_Teach,Dialog_Back,DIA_Godar_Teach_Back);
		
			if (Npc_GetTalentSkill (other,NPC_TALENT_SNEAK) == FALSE) 
			{
				Info_AddChoice		(DIA_Godar_Teach, B_BuildLearnString("Schleichen"	, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1))		,DIA_Godar_Teach_Thief_Sneak);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Zähne reissen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Godar_Teach_TROPHYS_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Blutfliegenstachel",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Godar_Teach_TROPHYS_BFSting);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Blutfliegenflügel",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Godar_Teach_TROPHYS_BFWing);
			};
			if (Godar_TeachDragonStuff == TRUE)
			{
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
				{ 
					Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Drachenschuppen ziehen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)),  DIA_Godar_Teach_TROPHYS_DragonScale);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
				{ 
					Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Drachenblut zapfen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)), DIA_Godar_Teach_TROPHYS_DragonBlood);
				};
			};
		}
	else
		{
			B_Say (self, other, "$NOLEARNYOUREBETTER"); //Ich kann dir nichts mehr beibringen. Du bist schon zu gut...
		};
};

FUNC VOID DIA_Godar_Teach_Back ()
{
	Info_ClearChoices 	(DIA_Godar_Teach);
}; 

FUNC VOID DIA_Godar_Teach_TROPHYS_Teeth ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_Teeth_13_00"); //Zähne entfernst du am besten mit einem stabilen Messer.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_BFSting ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_BFSting_13_00"); //Der Stachel der Blutfliege ist am schnellsten abgetrennt, wenn du den Stachel vor dem Abschneiden herausdrückst.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_BFWing ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_BFWing_13_00"); //Die Flügel der Blutfliege sind sehr empfindlich. Also sei vorsichtig, wenn du sie abschneidest.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_Thief_Sneak()
{
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_Sneak_13_00"); //Benutze beim Schleichen weiches Schuhwerk. Eine starre Sohle kann sehr laut sein.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_DragonScale ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonScale))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_DragonScale_13_00"); //Du brauchst viel Kraft, um die Schuppen eines Drachen zu bekommen. Aber du schaffst das schon.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonBlood))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_DragonBlood_13_00"); //Such nach einer weichen Stelle am Bauch des Drachen. Da ist es am leichtesten, an Drachenblut zu kommen.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};



//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Godar_AllDragonsDead   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 5;
	condition   = DIA_Godar_AllDragonsDead_Condition;
	information = DIA_Godar_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Ich hab alle Drachen getötet.";
				
};

FUNC INT DIA_Godar_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Godar_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Godar_AllDragonsDead_15_00"); //Ich hab alle Drachen getötet.
	AI_Output 	(self ,other,"DIA_Godar_AllDragonsDead_13_01"); //Na ja, und wenn schon. Hier im Tal gibt's noch genug für uns zu holen.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Godar_PICKPOCKET (C_INFO)
{
	npc			= DJG_711_Godar;
	nr			= 900;
	condition	= DIA_Godar_PICKPOCKET_Condition;
	information	= DIA_Godar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Godar_PICKPOCKET_Condition()
{
	C_Beklauen (16, 160);
};
 
FUNC VOID DIA_Godar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Godar_PICKPOCKET);
	Info_AddChoice		(DIA_Godar_PICKPOCKET, DIALOG_BACK 		,DIA_Godar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Godar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Godar_PICKPOCKET_DoIt);
};

func void DIA_Godar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Godar_PICKPOCKET);
};
	
func void DIA_Godar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Godar_PICKPOCKET);
};


