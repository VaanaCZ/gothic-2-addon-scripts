
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
	AI_Output (self ,other,"DIA_Godar_Hello_13_00"); //¿Eh? ¿Qué?
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
	description	= "¿De dónde vienes?";
};

FUNC INT DIA_Godar_ComeFrom_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Godar_ComeFrom_Info()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_15_00"); //¿De dónde vienes?
	AI_Output (self ,other,"DIA_Godar_ComeFrom_13_01"); //Venimos de... eh, la ciudad.
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"¡Sois bandidos!",DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice (DIA_Godar_ComeFrom,"¿Por qué nunca te he visto por la ciudad?",DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice (DIA_Godar_ComeFrom,"Ya veo. De la ciudad, pues.",DIA_Godar_ComeFrom_Understand);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_15_00"); //¡Sois bandidos!
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_13_01"); //¡Ten cuidado! ¡Intentas abarcar más de lo que puedes!
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"Tranquilo. No os voy a delatar.",DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice (DIA_Godar_ComeFrom,"No me das miedo.",DIA_Godar_ComeFrom_Bandits_NoFear);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits_KeepCalm ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00"); //Tranquilo. No os voy a delatar.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01"); //Eso espero, por tu bien. ¡Como lo hagas, te matamos!
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
};

FUNC VOID DIA_Godar_ComeFrom_Bandits_NoFear ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00"); //No me das miedo.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01"); //Ya veremos.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_15_00"); //No te he visto antes en la ciudad.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_13_01"); //No aguanto a la gente que mete las narices en los asuntos ajenos, ¿te enteras?
	
	Info_ClearChoices (DIA_Godar_ComeFrom);
	Info_AddChoice (DIA_Godar_ComeFrom,"No.",DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice (DIA_Godar_ComeFrom,"Entiendo, vienes de la ciudad.",DIA_Godar_ComeFrom_NotCity_Forget);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity_Forget ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_Forget_15_00"); //Entiendo, vienes de la ciudad.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01"); //Eso es.

	Info_ClearChoices (DIA_Godar_ComeFrom);
};

FUNC VOID DIA_Godar_ComeFrom_NotCity_CutThroat ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00"); //No.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01"); //Entonces tendré que hacértelo entender a palos.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Godar_ComeFrom_Understand ()
{
	AI_Output (other,self ,"DIA_Godar_ComeFrom_Understand_15_00"); //Ya veo. De la ciudad, pues.
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Understand_13_01"); //¿Ves? ¡Lo entiendes!
	AI_Output (self ,other,"DIA_Godar_ComeFrom_Understand_13_02"); //¡Ten, echa un trago!
	
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
	description	= "¿Qué estás haciendo aquí?";
};

FUNC INT DIA_Godar_Plan_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Godar_Plan_Info()
{
	AI_Output (other,self ,"DIA_Godar_Plan_15_00"); //¿Qué haces aquí?
	AI_Output (self ,other,"DIA_Godar_Plan_13_01"); //Nos enteramos de lo de la caza de dragones, así que hicimos el equipaje y vinimos.
	AI_Output (self ,other,"DIA_Godar_Plan_13_02"); //Pero para ser sincero, los dragones me dan igual. Solo quiero un poco de oro.
	AI_Output (self ,other,"DIA_Godar_Plan_13_03"); //Los dragones tienen oro, ¿no?
	AI_Output (other,self ,"DIA_Godar_Plan_15_04"); //Desde luego.
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
	description	= "¿Qué sabes de los dragones?";
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
	AI_Output (other,self ,"DIA_Godar_DragonLore_15_00"); //¿Qué sabes de los dragones?
	AI_Output (self ,other,"DIA_Godar_DragonLore_13_01"); //Solo las historias que les cuentan a los niños.
	AI_Output (self ,other,"DIA_Godar_DragonLore_13_02"); //Ya sabes, lo de las vírgenes, el oro, el aliento de fuego y esas cosas.
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
	description	= "¿Qué tenéis pensado hacer a partir de aquí?";
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
	AI_Output (other,self ,"DIA_Godar_Destination_15_00"); //¿Qué tenéis pensado hacer a partir de aquí?
	AI_Output (self ,other,"DIA_Godar_Destination_13_01"); //Ni idea. Todavía nos lo estamos pensando.
	
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
		{
			AI_Output (other,self ,"DIA_Godar_Destination_15_02"); //Podríais ir al castillo.
			AI_Output (self ,other,"DIA_Godar_Destination_13_03"); //No iría por nada del mundo. Por allí andan los paladines.
			AI_Output (self ,other,"DIA_Godar_Destination_13_04"); //No voy a volver a la cárcel. Estuve una vez y fue suficiente.
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
	description	= "¿Qué hay de los orcos?";
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
	AI_Output (other,self ,"DIA_Godar_Orks_15_00"); //¿Qué hay de los orcos?
	AI_Output (self ,other,"DIA_Godar_Orks_13_01"); //Tienen rodeado todo el castillo. No hay brechas.
	AI_Output (self ,other,"DIA_Godar_Orks_13_02"); //Es una locura intentar infiltrarse. Si intentas luchar, eres hombre muerto.
	AI_Output (self ,other,"DIA_Godar_Orks_13_03"); //Nadie consigue pasar.
	AI_Output (other,self ,"DIA_Godar_Orks_15_04"); //¿Ah, sí?
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
	description	= "¿Por qué estabas en chirona?";
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
	AI_Output (other,self ,"DIA_Godar_Prison_15_00"); //¿Por qué estabas en chirona?

	if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Godar_Prison_13_01"); //No voy a contártelo.
			AI_Output (self ,other,"DIA_Godar_Prison_13_02"); //Los magos estáis compinchados con los paladines. No, amigo mío. Ni hablar.
		}
	else
		{		
			AI_Output (self ,other,"DIA_Godar_Prison_13_03"); //El cerdo me pescó por cazar furtivamente. ¡Por dos liebres piojosas!
			AI_Output (self ,other,"DIA_Godar_Prison_13_04"); //Me echaron 10 años por eso.
			AI_Output (other,self ,"DIA_Godar_Prison_15_05"); //¿Eso fue todo?
			AI_Output (self ,other,"DIA_Godar_Prison_13_06"); //Bueno, también me defendí.
			AI_Output (other,self ,"DIA_Godar_Prison_15_07"); //¿Y?
			AI_Output (self ,other,"DIA_Godar_Prison_13_08"); //No pude hacer nada al respecto. El tipo se tropezó y se partió el cuello. ¡Te lo juro!
			
			Info_ClearChoices (DIA_Godar_Prison);
			Info_AddChoice (DIA_Godar_Prison,"Me resulta familiar.",DIA_Godar_Prison_Court);
			Info_AddChoice (DIA_Godar_Prison,"No debiste dejar que te pillaran.",DIA_Godar_Prison_Pissoff);
		};
};

FUNC VOID DIA_Godar_Prison_Court ()
{
	AI_Output (other,self ,"DIA_Godar_Prison_Court_15_00"); //Me resulta familiar.
	AI_Output (self ,other,"DIA_Godar_Prison_Court_13_01"); //Ya sabes a lo que me refiero. Los bastardos ricos no tienen ni idea que cómo se nos trata.
	AI_Output (self ,other,"DIA_Godar_Prison_Court_13_02"); //No les preocupa absolutamente nada.
	
	Info_ClearChoices (DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

FUNC VOID DIA_Godar_Prison_Pissoff ()
{
	AI_Output (other,self ,"DIA_Godar_Prison_Pissoff_15_00"); //No debiste dejar que te pillaran.
	AI_Output (self ,other,"DIA_Godar_Prison_Pissoff_13_01"); //(Enojado) Apuesto a que no has estado en la cárcel, ¿verdad?
	AI_Output (self ,other,"DIA_Godar_Prison_Pissoff_13_02"); //Entonces debería enseñarte lo que puede pasarle a uno en la cárcel.
	
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
	description	= "¿Me enseñas a cazar?";
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
	AI_Output (other,self ,"DIA_Godar_Hunting_15_00"); //¿Me enseñas a cazar?
	if (GodarLikesYou == FALSE)
	{
		AI_Output (self ,other,"DIA_Godar_Hunting_13_01"); //No hablarás en serio, ¿no? ¡Lárgate!
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Godar_Hunting_13_03"); //Un animal tiene algo más que carne. Puedes vender las pieles y las garras y sacarte un buen dinero.
		AI_Output (self ,other,"DIA_Godar_Hunting_13_04"); //Estoy impaciente por agarrar un dragón.
		
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
	description	= "Enséñame a destripar un dragón.";
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
	AI_Output (other,self ,"DIA_Godar_Dragonstuff_15_00"); //Enséñame a destripar un dragón.
	
	AI_Output (self,other ,"DIA_Godar_Dragonstuff_13_01"); //Para quedarte con toda la pasta, ¿eh?
	
	AI_Output (self,other ,"DIA_Godar_Dragonstuff_13_02"); //Bueno, vale, pero te va a costar 1000 monedas de oro.

	Info_ClearChoices	(DIA_Godar_Dragonstuff);	
	Info_AddChoice	(DIA_Godar_Dragonstuff, "No me parece que sea un precio adecuado.", DIA_Godar_Dragonstuff_nein );
	Info_AddChoice	(DIA_Godar_Dragonstuff, "Es lo justo.", DIA_Godar_Dragonstuff_fair );

};
func void DIA_Godar_Dragonstuff_fair ()
{
	AI_Output			(other, self, "DIA_Godar_Dragonstuff_fair_15_00"); //Es lo justo.

		if (B_GiveInvItems (other, self, ItMi_Gold,1000))
		{
			Godar_TeachDragonStuff = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Godar_Dragonstuff_fair_13_01"); //Sin dinero no hay nada que hacer. Primero saca el dinero.
		};
	Info_ClearChoices	(DIA_Godar_Dragonstuff);	
};

func void DIA_Godar_Dragonstuff_nein ()
{
	AI_Output			(other, self, "DIA_Godar_Dragonstuff_nein_15_00"); //No me parece que sea un precio adecuado.
	AI_Output			(self, other, "DIA_Godar_Dragonstuff_nein_13_01"); //Haz lo que quieras.
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
	description	= "Enséñame a cazar.";
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
	AI_Output (other,self ,"DIA_Godar_Teach_15_00"); //Enséñame a cazar.
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
				Info_AddChoice		(DIA_Godar_Teach, B_BuildLearnString("Sigilo"	, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1))		,DIA_Godar_Teach_Thief_Sneak);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Sacar dientes",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Godar_Teach_TROPHYS_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Aguijón de mosca de sangre",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Godar_Teach_TROPHYS_BFSting);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			{ 
				Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Alas de mosca de sangre",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Godar_Teach_TROPHYS_BFWing);
			};
			if (Godar_TeachDragonStuff == TRUE)
			{
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
				{ 
					Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Quitar escamas de dragón",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)),  DIA_Godar_Teach_TROPHYS_DragonScale);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
				{ 
					Info_AddChoice	(DIA_Godar_Teach, B_BuildLearnString ("Recoger sangre de dragón",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)), DIA_Godar_Teach_TROPHYS_DragonBlood);
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
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_Teeth_13_00"); //La mejor manera de arrancar los dientes es con un cuchillo robusto.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_BFSting ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_BFSting_13_00"); //El método más rápido para sacar el aguijón de una mosca de sangre es apretar el abdomen antes de cortarlo.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_BFWing ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_BFWing_13_00"); //Las alas de las moscas de sangre son muy delicadas. Ten cuidado cuando las cortes.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_Thief_Sneak()
{
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_Sneak_13_00"); //Cuando estés al acecho, usa calzado blando. Las suelas rígidas hacen mucho ruido.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_DragonScale ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonScale))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_DragonScale_13_00"); //Para quitarle las escamas a un dragón hace falta mucha fuerza, pero tú la tienes.
		};
	Info_ClearChoices 	(DIA_Godar_Teach);
};

FUNC VOID DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonBlood))
		{
			AI_Output			(self, other, "DIA_Godar_TEACHHUNTING_DragonBlood_13_00"); //Busca un punto blando en el vientre del dragón. En ese punto es más fácil extraerle su sangre.
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
	description	= "He matado a todos los dragones.";
				
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
	AI_Output	(other,self ,"DIA_Godar_AllDragonsDead_15_00"); //He matado a todos los dragones.
	AI_Output 	(self ,other,"DIA_Godar_AllDragonsDead_13_01"); //¿Y qué? En el valle aún hay un montón de presas para nosotros.
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


