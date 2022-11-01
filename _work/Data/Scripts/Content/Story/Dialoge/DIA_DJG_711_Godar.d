
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
	AI_Output (self ,other,"DIA_Godar_Hello_13_00"); //He? Co?
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
	description	= "Odkud jsi pâišel?";
};

FUNC INT DIA_Godar_ComeFrom_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Godar_ComeFrom_Info()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_15_00"); //Odkud jste pâišli?
	AI_Output (self ,other,"DIA_Godar_ComeFrom_13_01"); //Pâišli jsme z... eh, z męsta.
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"Jste banditi!",DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice (DIA_Godar_ComeFrom,"Proč jsme se pâedtím ve męstę nikdy nevidęli?",DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice (DIA_Godar_ComeFrom,"Jasnę. Tak teda z męsta.",DIA_Godar_ComeFrom_Understand);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_15_00"); //Jste banditi!
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_13_01"); //Opatrnę! Bereš si pâíliš velké sousto!
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"Klídek. Nechci vás prásknout.",DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice (DIA_Godar_ComeFrom,"Mę nevydęsíš.",DIA_Godar_ComeFrom_Bandits_NoFear);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits_KeepCalm ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00"); //Klídek. Nechci vás prásknout.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01"); //V to doufám. Ve tvém vlastním zájmu. Jinak jsi mrtvý!
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits_NoFear ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00"); //Mę nevydęsíš.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01"); //Uvidíme.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_15_00"); //Nikdy jsem tę ve męstę nevidęl.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_13_01"); //Nemůžu vystát lidi, co strkaj nos do vęcí, do kterejch jim nic není, jasný?
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"Houby.",DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice (DIA_Godar_ComeFrom,"Já vím, pâišel jsi z męsta.",DIA_Godar_ComeFrom_NotCity_Forget);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity_Forget ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_Forget_15_00"); //Já vím, pâišel jsi z męsta.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01"); //Pâesnę tak.

	Info_ClearChoices (DIA_Godar_ComeFrom);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity_CutThroat ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00"); //Houby.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01"); //Tak to bych to męl do tebe nahustit.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Godar_ComeFrom_Understand ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Understand_15_00"); //Jasnę. Tak teda z męsta.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Understand_13_01"); //Hele! On rozumí!
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Understand_13_02"); //Tady, lokni si!
	
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
	description	= "Co tady dęláš?";
};

FUNC INT DIA_Godar_Plan_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Godar_Plan_Info()
{
	AI_Output (other,self ,"DIA_Godar_Plan_15_00"); //Co tady dęláš?
	AI_Output (self ,other,"DIA_Godar_Plan_13_01"); //Zaslechli jsme o lovu draků. Tak jsme si sbalili saky paky a pâišli sem.
	AI_Output (self ,other,"DIA_Godar_Plan_13_02"); //Ale abych byl upâímný, o dracích nevím ani prd. Chci jen získat trochu zlata.
	AI_Output (self ,other,"DIA_Godar_Plan_13_03"); //Draci mají zlato, nebo ne?
	AI_Output (other,self ,"DIA_Godar_Plan_15_04"); //Samozâejmę.
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
	description	= "Co víš o tęch dracích?";
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
	AI_Output (other,self ,"DIA_Godar_DragonLore_15_00"); //Co víš o tęch dracích?
	AI_Output (self ,other,"DIA_Godar_DragonLore_13_01"); //Slyšel jsem jen pohádky pro dęti.
	AI_Output (self ,other,"DIA_Godar_DragonLore_13_02"); //Znáš to, panny, zlato, ohnivý dech a takový vęci.
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
	description	= "Kam se chystáte vyrazit?";
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
	AI_Output (other,self ,"DIA_Godar_Destination_15_00"); //Kam se chystáte vyrazit?
	AI_Output (self ,other,"DIA_Godar_Destination_13_01"); //To netuším. Ještę jsme se nerozhodli.
	
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
		{
			AI_Output (other,self ,"DIA_Godar_Destination_15_02"); //Męli byste zajít na hrad.
			AI_Output (self ,other,"DIA_Godar_Destination_13_03"); //Tam mę nikdo nedostane ani párem koní. Ne k paladinům.
			AI_Output (self ,other,"DIA_Godar_Destination_13_04"); //Nemám v úmyslu vrátit se do vęzení. Už jsem tam jednou byl a docela mi to stačí.
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
	description	= "A co skâeti?";
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
	AI_Output (other,self ,"DIA_Godar_Orks_15_00"); //A co skâeti?
	AI_Output (self ,other,"DIA_Godar_Orks_13_01"); //Obléhají celý hrad. Nenechali jedinou skulinu.
	AI_Output (self ,other,"DIA_Godar_Orks_13_02"); //Pokoušet se tam proplížit je naprostý nesmysl. Ani nemysli na to, že by ses tam prosekal, jinak jsi mrtvý muž.
	AI_Output (self ,other,"DIA_Godar_Orks_13_03"); //Nikomu se ještę nepodaâilo tamtudy projít.
	AI_Output (other,self ,"DIA_Godar_Orks_15_04"); //Vážnę.
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
	description	= "Za co jsi sedęl?";
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
	AI_Output (other,self ,"DIA_Godar_Prison_15_00"); //Za co jsi sedęl?

	if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Godar_Prison_13_01"); //Vypadám snad, že bych se ti to chystal vyklopit, co?
			AI_Output (self ,other,"DIA_Godar_Prison_13_02"); //Vy mágové jste s paladiny ve spojení. Ne, ne, pâíteli. Zapomeŕ na to.
		}
	else
		{		
			AI_Output (self ,other,"DIA_Godar_Prison_13_03"); //Ty hajzlové mę zabásli za pytlačení. Kvůli dvęma zavšivenejm zajícům!
			AI_Output (self ,other,"DIA_Godar_Prison_13_04"); //Napaâili mi za to 10 let.
			AI_Output (other,self ,"DIA_Godar_Prison_15_05"); //A to bylo všechno?
			AI_Output (self ,other,"DIA_Godar_Prison_13_06"); //No, taky jsem se samozâejmę bránil.
			AI_Output (other,self ,"DIA_Godar_Prison_15_07"); //A?
			AI_Output (self ,other,"DIA_Godar_Prison_13_08"); //Nemohl jsem nic dęlat, ten chlápek zakopnul a zlomil si vaz. Vážnę!
			
			Info_ClearChoices (DIA_Godar_Prison);
			Info_AddChoice (DIA_Godar_Prison,"To zní povędomę.",DIA_Godar_Prison_Court);
			Info_AddChoice (DIA_Godar_Prison,"Nemęl ses nechat chytit.",DIA_Godar_Prison_Pissoff);
		};
};

FUNC VOID DIA_Godar_Prison_Court ()
{
	AI_Output (other,self ,"DIA_Godar_Prison_Court_15_00"); //To zní povędomę.
	AI_Output (self ,other,"DIA_Godar_Prison_Court_13_01"); //Víš, co myslím. Ty bohatý bastardi nemají ani tucha, jak tu s náma zacházeli.
	AI_Output (self ,other,"DIA_Godar_Prison_Court_13_02"); //Vůbec je to nezajímalo.
	
	Info_ClearChoices (DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

FUNC VOID DIA_Godar_Prison_Pissoff ()
{
	AI_Output (other,self ,"DIA_Godar_Prison_Pissoff_15_00"); //Nemęl ses nechat chytit.
	AI_Output (self ,other,"DIA_Godar_Prison_Pissoff_13_01"); //(vztekle) Vsadím se, žes nikdy nebyl zavâenej, co?
	AI_Output (self ,other,"DIA_Godar_Prison_Pissoff_13_02"); //Tak to bych ti męl ukázat, co se může tvýmu tęlu ve vęzení stát.
	
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
	description	= "Můžeš mę naučit nęco o lovu?";
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
	AI_Output (other,self ,"DIA_Godar_Hunting_15_00"); //Můžeš mę naučit nęco o lovu?
	if (GodarLikesYou == FALSE)
	{
		AI_Output (self ,other,"DIA_Godar_Hunting_13_01"); //To nemyslíš vážnę, co? Zmizni!
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Godar_Hunting_13_03"); //Ze zvíâat se dá získat mnohem víc než jen maso. Kožešiny a drápy můžeš pak nękde prodat. Dá se na tom docela vydęlat.
		AI_Output (self ,other,"DIA_Godar_Hunting_13_04"); //Už se nemůžu dočkat, až si to rozdám s drakem.
		
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
	description	= "Ukaž mi, jak vyvrhnout draka.";
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
	AI_Output (other,self ,"DIA_Godar_Dragonstuff_15_00"); //Ukaž mi, jak vykuchat draka.
	
	AI_Output (self,other ,"DIA_Godar_Dragonstuff_13_01"); //Chceš všechny prachy pro sebe, co?
	
	AI_Output (self,other ,"DIA_Godar_Dragonstuff_13_02"); //No dobrá, ale bude tę to stát 1000 zlatých.

	Info_ClearChoices	(DIA_Godar_Dragonstuff);	
	Info_AddChoice	(DIA_Godar_Dragonstuff, "Za tolik mi to nestojí.", DIA_Godar_Dragonstuff_nein );
	Info_AddChoice	(DIA_Godar_Dragonstuff, "To je fér.", DIA_Godar_Dragonstuff_fair );

};
func void DIA_Godar_Dragonstuff_fair ()
{
	AI_Output			(other, self, "DIA_Godar_Dragonstuff_fair_15_00"); //To je fér.

		if (B_GiveInvItems (other, self, ItMi_Gold,1000))
		{
			Godar_TeachDragonStuff = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Godar_Dragonstuff_fair_13_01"); //Ne bez prachů. Nejdâív mi dej ty peníze.
		};
	Info_ClearChoices	(DIA_Godar_Dragonstuff);	
};

func void DIA_Godar_Dragonstuff_nein ()
{
	AI_Output			(other, self, "DIA_Godar_Dragonstuff_nein_15_00"); //Za tolik mi to nestojí.
	AI_Output			(self, other, "DIA_Godar_Dragonstuff_nein_13_01"); //Jak je libo.
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
	description	= "Ukaž mi, jak lovit.";
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
	AI_Output (other,self ,"DIA_Godar_Teach_15_00"); //Ukaž mi, jak lovit.
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
				Info_AddChoice		(DIA_Godar_Teach, B_BuildLearnString("Plížení"	, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1))		,DIA_Godar_Teach_Thief_Sneak);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Vyjmutí zubů",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Godar_Teach_TROPHYS_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Žihadla krvavých much",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Godar_Teach_TROPHYS_BFSting);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Kâídla krvavých much",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Godar_Teach_TROPHYS_BFWing);
			};
			if (Godar_TeachDragonStuff == TRUE)
			{
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
				{ 
					Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Získání dračích šupin",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)),  DIA_Godar_Teach_TROPHYS_DragonScale);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
				{ 
					Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Získání dračí krve",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)), DIA_Godar_Teach_TROPHYS_DragonBlood);
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
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_Teeth_13_00"); //Nejlepší způsob, jak získat zuby, je za pomoci poâádného nože.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_BFSting ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_BFSting_13_00"); //Nejrychlejší způsob, jak získat žihadlo krvavé mouchy, je vymáčknout ho dozadu pâed tím, než ho vyâízneš.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_BFWing ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_BFWing_13_00"); //Kâídla krvavých much jsou velmi kâehká. Takže až je budeš odâezávat, musíš být opravdu opatrný.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_Thief_Sneak()
{
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_Sneak_13_00"); //Když se chceš plížit, nazuj si mękké boty. Tuhá podrážka může nadęlat spoustu hluku.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_DragonScale ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonScale))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_DragonScale_13_00"); //Abys mohl z draka dostat jeho šupiny, budeš potâebovat spoustu síly. Ale dá se to zvládnout.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonBlood))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_DragonBlood_13_00"); //Najdi si na dračím bâichu mękké místečko. Tam je vyjmutí šupin nejsnazší.
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
	description	= "Zabil jsem všechny draky.";
				
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
	AI_Output	(other,self ,"DIA_Godar_AllDragonsDead_15_00"); //Zabil jsem všechny draky.
	AI_Output 	(self ,other,"DIA_Godar_AllDragonsDead_13_01"); //No a. Tady v údolí nám toho zůstalo ještę spousta.
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


