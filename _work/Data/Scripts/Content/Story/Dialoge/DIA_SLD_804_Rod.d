// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Rod_EXIT(C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 999;
	condition	= DIA_Rod_EXIT_Condition;
	information	= DIA_Rod_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rod_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rod_EXIT_Info()
{	
	AI_EquipBestMeleeWeapon(self); 
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Rod_Hello (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 1;
	condition	= DIA_Rod_Hello_Condition;
	information	= DIA_Rod_Hello_Info;
	permanent	= FALSE;
	description	= "¿Va todo bien?"; 
};                       

FUNC INT DIA_Rod_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Rod_Hello_Info()
{	
	AI_Output (other, self, "DIA_Rod_Hello_15_00"); //¿Cómo van las cosas?
	if (other.guild != GIL_SLD)
	{
		AI_Output (self, other, "DIA_Rod_Hello_06_01"); //(Sin darle importancia) ¿Qué quieres de mí, pichoncito?
	
			if (other.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Rod_Hello_06_02"); //¿No pudieron hacerte hueco e el monasterio?
			};	
	};
};

// ************************************************************
// 			  					WannaLearn 
// ************************************************************
var int Rod_SchwachGesagt;

instance DIA_Rod_WannaLearn (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 2;
	condition	= DIA_Rod_WannaLearn_Condition;
	information	= DIA_Rod_WannaLearn_Info;
	permanent	= TRUE;
	description	= "¿Puedes enseñarme a manejar armas a dos manos?"; 
};                       

FUNC INT DIA_Rod_WannaLearn_Condition()
{
	if (Rod_Teach2H == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_WannaLearn_Info()
{	
	AI_Output (other, self, "DIA_Rod_WannaLearn_15_00"); //¿Puedes enseñarme a manejar armas a dos manos?
		
	if (Rod_WetteGewonnen == TRUE)
	|| (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_01"); //No soy mal guerrero, pero eso no significa que sea buen maestro.
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_02"); //Sin embargo, creo que de todas maneras te puedo enseñar los fundamentos del combate cuerpo a cuerpo.
		
		if (Npc_HasItems (self, ItMw_2h_Rod) == 0)
		{
			AI_Output (self, other, "DIA_Rod_WannaLearn_06_03"); //Si me devuelves la espada, claro.
		}
		else
		{
			Rod_Teach2H = TRUE;
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_04"); //Escucha, chico. Hace falta mucha fuerza para empuñar un arma a dos manos.
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_05"); //¿Por qué no te escabulles en el prado para jugar un poco con las ovejas?
		Rod_SchwachGesagt = TRUE;
	};
};

// ******************************************************
//							Teach
// ******************************************************
var int Rod_Merke_2h;
// ------------------------------------------------------

INSTANCE DIA_Rod_Teach(C_INFO)
{
	npc			= SLD_804_Rod;
	nr			= 3;
	condition	= DIA_Rod_Teach_Condition;
	information	= DIA_Rod_Teach_Info;
	permanent	= TRUE;
	description = "¡Quiero mejorar mi habilidad de combate a dos manos!";
};                       

FUNC INT DIA_Rod_Teach_Condition()
{
	if (Rod_Teach2H == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_Teach_Info()
{	
	AI_Output (other,self, "DIA_Rod_Teach_15_00"); //¡Quiero mejorar mi habilidad de combate a dos manos!

	Rod_Merke_2h = other.HitChance[NPC_TALENT_2H];
	
	Info_ClearChoices (DIA_Rod_Teach);
	Info_AddChoice (DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Rod_Teach_2H_1);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Rod_Teach_2H_5);
};

FUNC VOID DIA_Rod_Teach_Back ()
{
	if (Rod_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output (self ,other,"DIA_Rod_Teach_BACK_06_00"); //Ya estás mejorando.
	};
	
	Info_ClearChoices (DIA_Rod_Teach);
};

FUNC VOID DIA_Rod_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);
	
	Info_ClearChoices (DIA_Rod_Teach);
	Info_AddChoice (DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Rod_Teach_2H_1);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Rod_Teach_2H_5);
};

FUNC VOID DIA_Rod_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
	
	Info_ClearChoices (DIA_Rod_Teach);
	Info_AddChoice (DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Rod_Teach_2H_1);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Rod_Teach_2H_5);
};

// ************************************************************
// 			  					WannaJoin 
// ************************************************************

instance DIA_Rod_WannaJoin (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 4;
	condition	= DIA_Rod_WannaJoin_Condition;
	information	= DIA_Rod_WannaJoin_Info;
	permanent	= TRUE;
	description	= "¡Quiero unirme a los mercenarios!"; 
};                       

FUNC INT DIA_Rod_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Rod_WannaJoin_15_00"); //¡Quiero unirme a los mercenarios!
	
	if (Npc_HasItems (self, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_01"); //¿Y por qué no me devuelves antes mi espada, eh?
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
		{	
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_02"); //Bien. Sin resentimientos.
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_03"); //Sabes luchar y eso es lo que cuenta.
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_04"); //La mayoría de los muchachos no le dan importancia a una peleílla entre amigos. Ya te acostumbrarás.
		}
		else //WetteGewonnen
		{
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_05"); //Oh, bien, llevas una espada decente. El resto lo aprenderás.
		};
		
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_06"); //En lo que a mí respecta, estás admitido.
		B_LogEntry (TOPIC_SLDRespekt,"Si quiero unirme a los mercenarios, conseguiré el voto de Rod.");
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_07"); //¡Por aquí no tenemos sitio para calzonazos!
		Rod_SchwachGesagt = TRUE;
	};
};

// ************************************************************
// 			  					Duell 
// ************************************************************

instance DIA_Rod_Duell (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 6;
	condition	= DIA_Rod_Duell_Condition;
	information	= DIA_Rod_Duell_Info;
	permanent	= TRUE;
	description	= "Parece que te tengo que enseñar modales, ¿no?"; 
};                       

FUNC INT DIA_Rod_Duell_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if (Rod_WetteGewonnen == FALSE)
		&& (Rod_SchwachGesagt == TRUE)
		{
			return TRUE;
		};
	
		if (Mis_Jarvis_SldKO == LOG_RUNNING)
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Rod_Duell_Info()
{	
	AI_Output (other, self, "DIA_Rod_Duell_15_00"); //Parece que tendré que enseñarte modales, ¿no?
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other, "DIA_Rod_Duell_06_01"); //Vamos, ¡inténtalo!
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_Duell_06_02"); //¡Esto no vas a aprenderlo!
	};
	
	AI_StopProcessInfos(self);
	B_Attack (self, other,AR_NONE, 1);
};	

// ************************************************************
// 			  				StarkGenug 
// ************************************************************

instance DIA_Rod_StarkGenug (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 5;
	condition	= DIA_Rod_StarkGenug_Condition;
	information	= DIA_Rod_StarkGenug_Info;
	permanent	= FALSE;
	description	= "¡Ya soy lo suficientemente fuerte!"; 
};                       

FUNC INT DIA_Rod_StarkGenug_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Rod_SchwachGesagt == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_StarkGenug_Info()
{	
	AI_Output (other, self, "DIA_Rod_StarkGenug_15_00"); //¡Ya soy lo suficientemente fuerte!
	AI_Output (self, other, "DIA_Rod_StarkGenug_06_01"); //¡Tonterías! ¡Si ni siquiera puedes LEVANTAR un espada de verdad, como la mía!
	
	Log_CreateTopic (Topic_RodWette,LOG_MISSION);
	Log_SetTopicStatus (Topic_RodWette,LOG_RUNNING);
	B_LogEntry (Topic_RodWette,"Rod, el mercenario, no cree que yo pueda blandir su espada.");
};	
	
	
// ************************************************************
// 			  				BINStarkGenug 
// ************************************************************

instance DIA_Rod_BINStarkGenug (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 5;
	condition	= DIA_Rod_BINStarkGenug_Condition;
	information	= DIA_Rod_BINStarkGenug_Info;
	permanent	= FALSE;
	description	= "¡He dicho que SOY lo suficientemente fuerte!"; 
};                       

FUNC INT DIA_Rod_BINStarkGenug_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Rod_StarkGenug))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_BINStarkGenug_Info()
{	
	AI_Output (other, self, "DIA_Rod_BINStarkGenug_15_00"); //¡He dicho que SOY lo suficientemente fuerte!
	AI_Output (self, other, "DIA_Rod_BINStarkGenug_06_01"); //Ohhh, me estás matando. ¿Quieres que hagamos una pequeña apuesta?
};	
	

// ************************************************************
// 			  				Wette
// ************************************************************
var int Rod_WetteGewonnen;
var int Rod_WetteAngenommen;
//-------------------------

instance DIA_Rod_Wette (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 5;
	condition	= DIA_Rod_Wette_Condition;
	information	= DIA_Rod_Wette_Info;
	permanent	= TRUE;
	description	= "¡Apuesto a que puedo blandir tu espada!"; 
};                       

FUNC INT DIA_Rod_Wette_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Rod_BINStarkGenug))
	&& (Npc_HasItems (self, ItMw_2h_Rod) > 0)
	&& (Rod_WetteAngenommen == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_Wette_Info()
{	
	AI_Output (other, self, "DIA_Rod_Wette_15_00"); //¡Apuesto a que puedo blandir tu espada!
	AI_Output (self, other, "DIA_Rod_Wette_06_01"); //¿De verdad? Mmm... (se lo piensa) ¿De cuánto estamos hablando?
	AI_Output (self, other, "DIA_Rod_Wette_06_02"); //Bien, pareces un pobre hombre. ¡Que sean 30 monedas de oro! ¿Tienes tanto?
		
	Info_ClearChoices (DIA_Rod_Wette);
	Info_AddChoice (DIA_Rod_Wette, "No.", DIA_Rod_Wette_No);
	Info_AddChoice (DIA_Rod_Wette, "Claro.", DIA_Rod_Wette_Yes);
	
	B_LogEntry (Topic_RodWette,"Rod se apuesta 30 piezas de oro a que no puedo blandir su espada.");
};

func void DIA_Rod_Wette_No()
{
	AI_Output (other, self, "DIA_Rod_Wette_No_15_00"); //No.
	AI_Output (self, other, "DIA_Rod_Wette_No_06_01"); //Oh, entonces vete.
	
	Info_ClearChoices (DIA_Rod_Wette);
};
	
func void DIA_Rod_Wette_Yes()
{
	AI_Output (other, self, "DIA_Rod_Wette_Yes_15_00"); //Claro.
	AI_Output (self, other, "DIA_Rod_Wette_Yes_06_01"); //Entonces, veamos...
	
	if (B_GiveInvItems (other,self, itmi_gold, 30))
	{
		Rod_WetteAngenommen = TRUE;
			
		AI_Output (other, self, "DIA_Rod_Wette_Yes_15_02"); //¡Toma!
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_03"); //(Con regocijo) De acuerdo, veamos lo fuerte que eres...
		
		B_GiveInvItems (self, other, ItMw_2h_Rod, 1);
		
		if (other.attribute[ATR_STRENGTH] >= 30)
		{
			AI_UnequipWeapons 		(other);
			AI_EquipBestMeleeWeapon	(other);
			AI_ReadyMeleeWeapon		(other);
							
			AI_Output (other, self, "DIA_Rod_Wette_Yes_15_04");//¡¿Así de fuerte?!
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_05");//(Perplejo) Parece que me has pillado.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_06");//No me lo esperaba. Desde luego no pareces tan fuerte.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_07");//Bueno, supongo que he perdido 30 monedas de oro. Tómalas.
			B_GiveInvItems (self, other, itmi_gold, 60);
			Rod_WetteGewonnen = TRUE;
			B_GivePlayerXP (XP_Rod); 
		}
		else
		{
			AI_Output (other, self, "DIA_Rod_Wette_Yes_15_08"); //No puedo levantar esta arma.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_09");//(Se ríe) ¡Eso es lo que yo decía!
		};
		
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_10");//Y ahora devuélveme mi arma.
		
		Info_ClearChoices (DIA_Rod_Wette);
		
		//Npc_RemoveInvItems (other,ItMw_2h_Rod,((Npc_HasItems (other,ItMw_2h_Rod))-1));		//Hoshi: Wilder HAck bitte stehen lassen!
		// Mike: AAAARGH!!!! genau DAS war der Fehler!!!
			
		Info_AddChoice (DIA_Rod_Wette, "No creo...", DIA_Rod_Wette_KeepIt);
		Info_AddChoice (DIA_Rod_Wette, "¡Aquí tienes!", DIA_Rod_Wette_GiveBack);
	}
	else
	{
		AI_Output (other, self, "DIA_Rod_Wette_Yes_15_11"); //¿Dónde la puse...?
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_12"); //No me extraña. Vuelve cuando tengas oro con el que apostar.
		
		Info_ClearChoices (DIA_Rod_Wette);
	};
};

func void DIA_Rod_Wette_GiveBack()
{
	AI_RemoveWeapon (other);
	AI_Output (other, self, "DIA_Rod_Wette_GiveBack_15_00"); //Aquí está.
	Info_ClearChoices (DIA_Rod_Wette);
	Info_AddChoice (DIA_Rod_Wette, "(entregarle el arma)", DIA_Rod_Wette_GiveBack2);
};

func void DIA_Rod_Wette_GiveBack2()
{
	B_GiveInvItems (other, self, ItMw_2h_Rod, 1);		
	if (Rod_WetteGewonnen == FALSE)
	{
		AI_Output (self, other, "DIA_Rod_Wette_GiveBack_06_01"); //¡Después de todo no eres más que un enclenque!
	};
	Info_ClearChoices (DIA_Rod_Wette);
};

func void DIA_Rod_Wette_KeepIt()
{
	AI_Output (other, self, "DIA_Rod_Wette_KeepIt_15_00"); //No creo...
	AI_Output (self, other, "DIA_Rod_Wette_KeepIt_06_01"); //(Amenazador) ¿Qué ha sido eso?
	AI_Output (other, self, "DIA_Rod_Wette_KeepIt_15_02"); //Creo que me la voy a quedar un poco más.
	AI_Output (self, other, "DIA_Rod_Wette_KeepIt_06_03"); //Espera, ¡bastardo!
	
	Info_ClearChoices (DIA_Rod_Wette);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1); 
};


// ************************************************************
// 			  				Schwert zurück
// ************************************************************
var int Rod_SchwertXPGiven;

instance DIA_Rod_GiveItBack (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 7;
	condition	= DIA_Rod_GiveItBack_Condition;
	information	= DIA_Rod_GiveItBack_Info;
	permanent	= TRUE;
	description	= "¡Toma tu espada!"; 
};                       

FUNC INT DIA_Rod_GiveItBack_Condition()
{
	if (Npc_HasItems (other, ItMw_2h_Rod) > 0)
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_GiveItBack_Info()
{	
	B_GiveInvItems (other, self, ItMw_2h_Rod, 1);
	
	AI_Output (other, self, "DIA_Rod_GiveItBack_15_00"); //¡Toma tu espada!
	AI_Output (self, other, "DIA_Rod_GiveItBack_06_01"); //¡Ya iba siendo hora!
	
	if (Rod_SchwertXPGiven == FALSE)
	{
		B_GivePlayerXP (XP_Ambient);
		Rod_SchwertXPGiven = TRUE;
	};
};

// ************************************************************
// 			  					PERM
// ************************************************************

instance DIA_Rod_PERM (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 1;
	condition	= DIA_Rod_PERM_Condition;
	information	= DIA_Rod_PERM_Info;
	permanent	= TRUE;
	description	= "¿Qué pasa?"; 
};                       

FUNC INT DIA_Rod_PERM_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Rod_Hello))
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_PERM_Info()
{	
	AI_Output (other, self, "DIA_Rod_PERM_15_00"); //¿Cómo va todo?
	
	if (Kapitel <= 2)	
	{
		if (other.guild == GIL_NONE)
		{
			if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
			&& (Rod_WetteGewonnen == FALSE)
			{
				AI_Output (self, other, "DIA_Rod_PERM_06_01"); //Eso no es asunto tuyo, debilucho.
				Rod_SchwachGesagt = TRUE;
			}
			else
			{
				AI_Output (self, other, "DIA_Rod_PERM_06_02"); //Tengo curiosidad por ver si te dejan que te unas.
			};
		}
		else if (other.guild == GIL_SLD)
		|| 		(other.guild == GIL_DJG)
		{
			AI_Output (self, other, "DIA_Rod_PERM_06_03"); //Ahora eres uno de los nuestros, chico. Nos encargaremos de eso.
		}
		else
		{
			AI_Output (self, other, "DIA_Rod_PERM_06_04"); //No eres uno de los nuestros, ¡mejor será que te vayas por ahí!
		};
	}

	if (Kapitel >= 3)
	{
		AI_Output (self, other, "DIA_Rod_PERM_06_05"); //Si todas esas historias de dragones son ciertas, ¡deberíamos juntarnos unos cuantos y acabar con esas bestias!
	};

	//### ab Kap 4 in OW ###
};

	
	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_RodSLD_PICKPOCKET (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 900;
	condition	= DIA_RodSLD_PICKPOCKET_Condition;
	information	= DIA_RodSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_RodSLD_PICKPOCKET_Condition()
{
	C_Beklauen (15, 35);
};
 
FUNC VOID DIA_RodSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_RodSLD_PICKPOCKET);
	Info_AddChoice		(DIA_RodSLD_PICKPOCKET, DIALOG_BACK 		,DIA_RodSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_RodSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_RodSLD_PICKPOCKET_DoIt);
};

func void DIA_RodSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_RodSLD_PICKPOCKET);
};
	
func void DIA_RodSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_RodSLD_PICKPOCKET);
};






	
	
	




	
	
		



	
	
		
		







	
	//NUR Bis Kapitel 3!
	
	/**/
	
	
