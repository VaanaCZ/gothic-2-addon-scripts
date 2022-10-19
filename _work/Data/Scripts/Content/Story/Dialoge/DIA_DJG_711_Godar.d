
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
//	Wo kommt ihr �berhaupt her? 
//*********************************************************************
INSTANCE DIA_Godar_ComeFrom   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 4;
	condition   = DIA_Godar_ComeFrom_Condition;
	information = DIA_Godar_ComeFrom_Info;
	permanent   = FALSE;
	description	= "Odkud jsi p�i�el?";
};

FUNC INT DIA_Godar_ComeFrom_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Godar_ComeFrom_Info()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_15_00"); //Odkud jste p�i�li?
	AI_Output (self ,other,"DIA_Godar_ComeFrom_13_01"); //P�i�li jsme z... eh, z m�sta.
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"Jste banditi!",DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice (DIA_Godar_ComeFrom,"Pro� jsme se p�edt�m ve m�st� nikdy nevid�li?",DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice (DIA_Godar_ComeFrom,"Jasn�. Tak teda z m�sta.",DIA_Godar_ComeFrom_Understand);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_15_00"); //Jste banditi!
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_13_01"); //Opatrn�! Bere� si p��li� velk� sousto!
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"Kl�dek. Nechci v�s pr�sknout.",DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice (DIA_Godar_ComeFrom,"M� nevyd�s�.",DIA_Godar_ComeFrom_Bandits_NoFear);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits_KeepCalm ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00"); //Kl�dek. Nechci v�s pr�sknout.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01"); //V to douf�m. Ve tv�m vlastn�m z�jmu. Jinak jsi mrtv�!
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits_NoFear ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00"); //M� nevyd�s�.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01"); //Uvid�me.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_15_00"); //Nikdy jsem t� ve m�st� nevid�l.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_13_01"); //Nem��u vyst�t lidi, co strkaj nos do v�c�, do kterejch jim nic nen�, jasn�?
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"Houby.",DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice (DIA_Godar_ComeFrom,"J� v�m, p�i�el jsi z m�sta.",DIA_Godar_ComeFrom_NotCity_Forget);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity_Forget ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_Forget_15_00"); //J� v�m, p�i�el jsi z m�sta.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01"); //P�esn� tak.

	Info_ClearChoices (DIA_Godar_ComeFrom);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity_CutThroat ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00"); //Houby.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01"); //Tak to bych to m�l do tebe nahustit.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Godar_ComeFrom_Understand ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Understand_15_00"); //Jasn�. Tak teda z m�sta.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Understand_13_01"); //Hele! On rozum�!
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
	description	= "Co tady d�l�?";
};

FUNC INT DIA_Godar_Plan_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Godar_Plan_Info()
{
	AI_Output (other,self ,"DIA_Godar_Plan_15_00"); //Co tady d�l�?
	AI_Output (self ,other,"DIA_Godar_Plan_13_01"); //Zaslechli jsme o lovu drak�. Tak jsme si sbalili saky paky a p�i�li sem.
	AI_Output (self ,other,"DIA_Godar_Plan_13_02"); //Ale abych byl up��mn�, o drac�ch nev�m ani prd. Chci jen z�skat trochu zlata.
	AI_Output (self ,other,"DIA_Godar_Plan_13_03"); //Draci maj� zlato, nebo ne?
	AI_Output (other,self ,"DIA_Godar_Plan_15_04"); //Samoz�ejm�.
};

//*********************************************************************
//	Wisst ihr was �ber die Drachen? 
//*********************************************************************
INSTANCE DIA_Godar_DragonLore   (C_INFO)
{
	npc         = DJG_711_Godar;
	nr          = 5;
	condition   = DIA_Godar_DragonLore_Condition;
	information = DIA_Godar_DragonLore_Info;
	permanent   = FALSE;
	description	= "Co v� o t�ch drac�ch?";
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
	AI_Output (other,self ,"DIA_Godar_DragonLore_15_00"); //Co v� o t�ch drac�ch?
	AI_Output (self ,other,"DIA_Godar_DragonLore_13_01"); //Sly�el jsem jen poh�dky pro d�ti.
	AI_Output (self ,other,"DIA_Godar_DragonLore_13_02"); //Zn� to, panny, zlato, ohniv� dech a takov� v�ci.
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
	description	= "Kam se chyst�te vyrazit?";
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
	AI_Output (other,self ,"DIA_Godar_Destination_15_00"); //Kam se chyst�te vyrazit?
	AI_Output (self ,other,"DIA_Godar_Destination_13_01"); //To netu��m. Je�t� jsme se nerozhodli.
	
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
		{
			AI_Output (other,self ,"DIA_Godar_Destination_15_02"); //M�li byste zaj�t na hrad.
			AI_Output (self ,other,"DIA_Godar_Destination_13_03"); //Tam m� nikdo nedostane ani p�rem kon�. Ne k paladin�m.
			AI_Output (self ,other,"DIA_Godar_Destination_13_04"); //Nem�m v �myslu vr�tit se do v�zen�. U� jsem tam jednou byl a docela mi to sta��.
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
	description	= "A co sk�eti?";
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
	AI_Output (other,self ,"DIA_Godar_Orks_15_00"); //A co sk�eti?
	AI_Output (self ,other,"DIA_Godar_Orks_13_01"); //Obl�haj� cel� hrad. Nenechali jedinou skulinu.
	AI_Output (self ,other,"DIA_Godar_Orks_13_02"); //Pokou�et se tam propl�it je naprost� nesmysl. Ani nemysli na to, �e by ses tam prosekal, jinak jsi mrtv� mu�.
	AI_Output (self ,other,"DIA_Godar_Orks_13_03"); //Nikomu se je�t� nepoda�ilo tamtudy proj�t.
	AI_Output (other,self ,"DIA_Godar_Orks_15_04"); //V�n�.
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
	description	= "Za co jsi sed�l?";
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
	AI_Output (other,self ,"DIA_Godar_Prison_15_00"); //Za co jsi sed�l?

	if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Godar_Prison_13_01"); //Vypad�m snad, �e bych se ti to chystal vyklopit, co?
			AI_Output (self ,other,"DIA_Godar_Prison_13_02"); //Vy m�gov� jste s paladiny ve spojen�. Ne, ne, p��teli. Zapome� na to.
		}
	else
		{		
			AI_Output (self ,other,"DIA_Godar_Prison_13_03"); //Ty hajzlov� m� zab�sli za pytla�en�. Kv�li dv�ma zav�ivenejm zaj�c�m!
			AI_Output (self ,other,"DIA_Godar_Prison_13_04"); //Napa�ili mi za to 10 let.
			AI_Output (other,self ,"DIA_Godar_Prison_15_05"); //A to bylo v�echno?
			AI_Output (self ,other,"DIA_Godar_Prison_13_06"); //No, taky jsem se samoz�ejm� br�nil.
			AI_Output (other,self ,"DIA_Godar_Prison_15_07"); //A?
			AI_Output (self ,other,"DIA_Godar_Prison_13_08"); //Nemohl jsem nic d�lat, ten chl�pek zakopnul a zlomil si vaz. V�n�!
			
			Info_ClearChoices (DIA_Godar_Prison);
			Info_AddChoice (DIA_Godar_Prison,"To zn� pov�dom�.",DIA_Godar_Prison_Court);
			Info_AddChoice (DIA_Godar_Prison,"Nem�l ses nechat chytit.",DIA_Godar_Prison_Pissoff);
		};
};

FUNC VOID DIA_Godar_Prison_Court ()
{
	AI_Output (other,self ,"DIA_Godar_Prison_Court_15_00"); //To zn� pov�dom�.
	AI_Output (self ,other,"DIA_Godar_Prison_Court_13_01"); //V�, co mysl�m. Ty bohat� bastardi nemaj� ani tucha, jak tu s n�ma zach�zeli.
	AI_Output (self ,other,"DIA_Godar_Prison_Court_13_02"); //V�bec je to nezaj�malo.
	
	Info_ClearChoices (DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

FUNC VOID DIA_Godar_Prison_Pissoff ()
{
	AI_Output (other,self ,"DIA_Godar_Prison_Pissoff_15_00"); //Nem�l ses nechat chytit.
	AI_Output (self ,other,"DIA_Godar_Prison_Pissoff_13_01"); //(vztekle) Vsad�m se, �es nikdy nebyl zav�enej, co?
	AI_Output (self ,other,"DIA_Godar_Prison_Pissoff_13_02"); //Tak to bych ti m�l uk�zat, co se m��e tv�mu t�lu ve v�zen� st�t.
	
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
	description	= "M��e� m� nau�it n�co o lovu?";
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
	AI_Output (other,self ,"DIA_Godar_Hunting_15_00"); //M��e� m� nau�it n�co o lovu?
	if (GodarLikesYou == FALSE)
	{
		AI_Output (self ,other,"DIA_Godar_Hunting_13_01"); //To nemysl� v�n�, co? Zmizni!
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Godar_Hunting_13_03"); //Ze zv��at se d� z�skat mnohem v�c ne� jen maso. Ko�e�iny a dr�py m��e� pak n�kde prodat. D� se na tom docela vyd�lat.
		AI_Output (self ,other,"DIA_Godar_Hunting_13_04"); //U� se nem��u do�kat, a� si to rozd�m s drakem.
		
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
	description	= "Uka� mi, jak vyvrhnout draka.";
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
	AI_Output (other,self ,"DIA_Godar_Dragonstuff_15_00"); //Uka� mi, jak vykuchat draka.
	
	AI_Output (self,other ,"DIA_Godar_Dragonstuff_13_01"); //Chce� v�echny prachy pro sebe, co?
	
	AI_Output (self,other ,"DIA_Godar_Dragonstuff_13_02"); //No dobr�, ale bude t� to st�t 1000 zlat�ch.

	Info_ClearChoices	(DIA_Godar_Dragonstuff);	
	Info_AddChoice	(DIA_Godar_Dragonstuff, "Za tolik mi to nestoj�.", DIA_Godar_Dragonstuff_nein );
	Info_AddChoice	(DIA_Godar_Dragonstuff, "To je f�r.", DIA_Godar_Dragonstuff_fair );

};
func void DIA_Godar_Dragonstuff_fair ()
{
	AI_Output			(other, self, "DIA_Godar_Dragonstuff_fair_15_00"); //To je f�r.

		if (B_GiveInvItems (other, self, ItMi_Gold,1000))
		{
			Godar_TeachDragonStuff = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Godar_Dragonstuff_fair_13_01"); //Ne bez prach�. Nejd��v mi dej ty pen�ze.
		};
	Info_ClearChoices	(DIA_Godar_Dragonstuff);	
};

func void DIA_Godar_Dragonstuff_nein ()
{
	AI_Output			(other, self, "DIA_Godar_Dragonstuff_nein_15_00"); //Za tolik mi to nestoj�.
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
	description	= "Uka� mi, jak lovit.";
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
	AI_Output (other,self ,"DIA_Godar_Teach_15_00"); //Uka� mi, jak lovit.
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
				Info_AddChoice		(DIA_Godar_Teach, B_BuildLearnString("Pl�en�"	, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1))		,DIA_Godar_Teach_Thief_Sneak);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Vyjmut� zub�",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Godar_Teach_TROPHYS_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("�ihadla krvav�ch much",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Godar_Teach_TROPHYS_BFSting);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("K��dla krvav�ch much",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Godar_Teach_TROPHYS_BFWing);
			};
			if (Godar_TeachDragonStuff == TRUE)
			{
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
				{ 
					Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Z�sk�n� dra��ch �upin",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)),  DIA_Godar_Teach_TROPHYS_DragonScale);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
				{ 
					Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Z�sk�n� dra�� krve",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)), DIA_Godar_Teach_TROPHYS_DragonBlood);
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
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_Teeth_13_00"); //Nejlep�� zp�sob, jak z�skat zuby, je za pomoci po��dn�ho no�e.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_BFSting ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_BFSting_13_00"); //Nejrychlej�� zp�sob, jak z�skat �ihadlo krvav� mouchy, je vym��knout ho dozadu p�ed t�m, ne� ho vy��zne�.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_BFWing ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_BFWing_13_00"); //K��dla krvav�ch much jsou velmi k�ehk�. Tak�e a� je bude� od�ez�vat, mus� b�t opravdu opatrn�.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_Thief_Sneak()
{
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_Sneak_13_00"); //Kdy� se chce� pl�it, nazuj si m�kk� boty. Tuh� podr�ka m��e nad�lat spoustu hluku.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_DragonScale ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonScale))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_DragonScale_13_00"); //Abys mohl z draka dostat jeho �upiny, bude� pot�ebovat spoustu s�ly. Ale d� se to zvl�dnout.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonBlood))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_DragonBlood_13_00"); //Najdi si na dra��m b�ichu m�kk� m�ste�ko. Tam je vyjmut� �upin nejsnaz��.
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
	description	= "Zabil jsem v�echny draky.";
				
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
	AI_Output	(other,self ,"DIA_Godar_AllDragonsDead_15_00"); //Zabil jsem v�echny draky.
	AI_Output 	(self ,other,"DIA_Godar_AllDragonsDead_13_01"); //No a. Tady v �dol� n�m toho z�stalo je�t� spousta.
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


