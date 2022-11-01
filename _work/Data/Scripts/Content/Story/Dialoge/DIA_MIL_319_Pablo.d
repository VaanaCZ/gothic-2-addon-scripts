///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_EXIT   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 999;
	condition   = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pablo_PICKPOCKET (C_INFO)
{
	npc			= Mil_319_Pablo;
	nr			= 900;
	condition	= DIA_Pablo_PICKPOCKET_Condition;
	information	= DIA_Pablo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Robar su llave sería un juego de niños)";
};                       

FUNC INT DIA_Pablo_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_01) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Pablo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pablo_PICKPOCKET);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_BACK 		,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Pablo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pablo_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info WANTED
///////////////////////////////////////////////////////////////////////
var int Pablo_belogen;
//--------------------

instance DIA_Pablo_WANTED		(C_INFO)
{
	npc			 = 	Mil_319_Pablo;
	nr			 = 	1;
	condition	 = 	DIA_Pablo_WANTED_Condition;
	information	 = 	DIA_Pablo_WANTED_Info;
	important	 = 	TRUE;
};
func int DIA_Pablo_WANTED_Condition ()
{
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
func void DIA_Pablo_WANTED_Info ()
{
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //Oye, espera... Me resultas familiar.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //¿Qué es lo que quieres?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //He visto tu cara en algún lugar... ah... ¡eso es!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Ten. Unos bandidos que encarcelamos hace unos días llevaban este dibujo encima. Se parece mucho a ti.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Por lo visto, esos tipos te estaban buscando.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"No, seguro que te equivocas.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"Vaya, a mí no se me habría ocurrido.",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //No, seguro que te equivocas. No me pasa nada...
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Lo que tú digas, forastero.
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie außerhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //Pero si resulta que es tu cara, y si tienes problemas, mantenlos fuera de la ciudad. Las cosas ya están bastante complicadas por aquí.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //Y los forasteros que traen problemas a la ciudad no se quedan mucho tiempo. Espero haberme explicado.
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //Vaya, a mí no se me habría ocurrido.
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //Muy gracioso... ¿Qué querían de ti esos tipos?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Pregúntaselo tú. Los tenéis a buen recaudo, ¿no?
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //No, han muerto.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //En ese caso, creo que nunca lo sabremos.
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Schönen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //Si estás metido en algún lío, ve a hablar con lord Andre. A lo mejor puede ayudarte. Lo encontrarás en el cuartel.
	
	AI_StopProcessInfos (self);
};

// *************************************************************
// 							Banditen
// *************************************************************
INSTANCE DIA_Pablo_Banditen   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent   = FALSE;
	description = "¿Qué sabes de los bandidos?";
};
FUNC INT DIA_Pablo_Banditen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Banditen_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_03"); //¿Qué sabes de los bandidos?
	//AI_Output (other, self, "DIA_Pablo_Banditen_15_00"); //Was weißt du über die Banditen, die vor der Stadt ihr Unwesen treiben?
	AI_Output (self ,other,"DIA_Pablo_Add_12_04"); //Todos proceden de la maldita colonia minera, pero hay varios grupos escindidos.
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //Algunos se han refugiado en las montañas y otros han hecho causa común con Onar, el terrateniente.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //Pero los más problemáticos son los bandidos de las afueras de la ciudad.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //Por su culpa, ninguno de los mercaderes se atreve a salir de la ciudad.
};

// *************************************************************
// 							HakonBandits
// *************************************************************
INSTANCE DIA_Pablo_HakonBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent   = FALSE;
	description = "¿Qué sabes de los bandidos que robaron al mercader Hakon?";
};
FUNC INT DIA_Pablo_HakonBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Miliz))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_HakonBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_20"); //¿Qué sabes de los bandidos que robaron al mercader Hakon?
	AI_Output (self ,other,"DIA_Pablo_Add_12_21"); //Ah sí, ese asunto. No me lo recuerdes...
	AI_Output (self ,other,"DIA_Pablo_Add_12_22"); //Por lo que sabemos, son responsables de muchos de los ataques a mercaderes.
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Esas ratas se han escabullido en sus cubiles y no se atreven a salir.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //En una ocasión conseguimos localizarlos y seguirlos, pero interrumpimos la persecución en el bosque de las afueras de la ciudad.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //Por allí rondan muchas bestias, y es muy peligroso.
	
	B_LogEntry(TOPIC_HakonBanditen,"Los bandidos que robaron a Hakon se esconden en los bosques cercanos a la ciudad." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //Pero hay una cosa más...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //En Khorinis han aparecido algunas de las mercancías robadas.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //Esto significa que saben introducirlas en la ciudad y venderlas...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //Sí, sospechamos que cuentan con un perista en la ciudad, pero aún no hemos logrado pillarle.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //Si averiguas algo al respecto, recuerda que lord Andre ofrece una recompensa por el perista.
	
		B_LogEntry(TOPIC_HakonBanditen,"Es probable que los bandidos estén asociados con algún comerciante de la ciudad. Lord Andre ofrece una recompensa por el comerciante." );
	};
}; 

// *************************************************************
// 							MyBandits
// *************************************************************
INSTANCE DIA_Pablo_MyBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 4;
	condition   = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent   = FALSE;
	description = "¿De dónde venían los bandidos que tenían el cartel con mi retrato?";
};
FUNC INT DIA_Pablo_MyBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Wanted))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_MyBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //¿De dónde venían los bandidos que tenían el cartel con mi retrato?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //¡Ajá! Así que es tu retrato. ¿Por qué no lo has admitido de inmediato?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //(Exigente) ¿Por qué te buscan?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //¡De verdad que no lo sé!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Sí, ya sé. Déjame que te diga una cosa. Si pensara que estabas compinchado con los bandidos, ya estarías a la sombra, ¿me oyes?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //Aun así, será mejor que informe a lord Andre de este incidente...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //Pero respondiendo a tu pregunta...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //Los cogimos cerca de la casa del terrateniente.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //No obstante, no parecen gente de Onar.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //Creo que forman parte de un grupo menor que se ha refugiado en las montañas cerca de la granja de Onar.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //Si tienes intención de ir, te advierto que esos asesinos no se andan con rodeos a la hora de despachar a alguien.
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //Lo recordaré.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_Perm   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 1;
	condition   = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent   = TRUE;
	description = "¿Cómo van las cosas?";
};
FUNC INT DIA_Pablo_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Perm_Info()
{
	AI_Output (other, self, "DIA_Pablo_Perm_15_00"); //¿Cuál es la situación?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //Siempre he dicho que los mercenarios no son de fiar.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //Ya es hora de que demos una lección a esa escoria. Bennet no ha podido planear todo esto.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //El asesinato del honorable paladín Lothar ha causado en mí una honda impresión.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //No obstante, sé que la iglesia castigará con justicia al villano.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //¿Qué haces rondando por aquí? Si intentas liberar a tu amigo mercenario, olvídate del tema.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //Es terrible. Ahora nos incitan a que nos peleemos entre nosotros.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //Si no hubieras conseguido encontrar al verdadero culpable del asesinato, los orcos no habrían tenido que mover un dedo.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //Me preocupa lo que sucederá si los paladines se marchan.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //Puedes contar con nosotros. Emplearemos todos los medios a nuestro alcance para asegurarnos de que la ciudad no degenera en un pozo de iniquidad.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //Ándate con ojo. A los bribones como tú los vigilamos muy de cerca.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //Por ahora la cosa está tranquila. Solo nos causan problemas los bandidos de fuera de la ciudad.
	};	

}; 


