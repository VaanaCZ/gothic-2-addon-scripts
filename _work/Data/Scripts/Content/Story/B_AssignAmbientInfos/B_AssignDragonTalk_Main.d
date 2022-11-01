// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "¿Cómo has venido por aquí?";
};                       

FUNC INT DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};	
};

FUNC VOID DIA_DragonTalk_Main_1_Info()
{	

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //Siervo del mal, ¿qué te ha traído aquí? ¿Has venido únicamente para sembrar terror y pánico?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //No vas a desentrañar la finalidad de nuestro congreso en este mundo, hombrecillo.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "¿Cómo puedo hacer que hablen los demás dragones?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "¿Qué tengo que hacer para que vuelvas a desaparecer?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //En el nombre de Innos, ¿qué debo hacer para desterraros de nuevo de los reinos humanos?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //(Se ríe) Antes de que puedas hacer nada, debes comprender el significado de nuestro congreso.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Sin embargo, nadie va a revelártelo de motu proprio.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Solo el Ojo podría soltarnos la lengua y hacer que reveláramos nuestras verdaderas metas.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //En cualquier caso, no te resultará útil cuando estés muerto.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //Ya nos han informado que has elegido la senda del cazador de dragones.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Por lo tanto, hemos enviado a nuestros vástagos a tu mundo para asegurar la continuación de nuestro linaje ancestral.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Ya has fracasado, hombrecillo.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Uno de los dragones masculló algo acerca de su ''progenie'' y la continuidad de su línea de sangre ancestral. Me temo que han extendido su semilla por el mundo civilizado."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //El Ojo te ha permitido acceder hasta aquí. Sin embargo, demostrarás tu valía en un combate singular.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //¿Cómo puedo hacer que hablen los demás dragones?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Solo mi corazón podría ayudarte a renovar el poder del Ojo.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Pero no vas a conseguir arrebatármelo.

};


// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_2(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_2_Condition;
	information	= DIA_DragonTalk_Main_2_Info;
	permanent	= FALSE;
	description = "¿Quién te ha enviado aquí?";
};                       

FUNC INT DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_2_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //¿A quién obedeces? ¿Quién te envía?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //El amo controla con su palabra de poder nuestro futuro y bienestar. Dentro de poco tiempo nadie podrá resistirse a él.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Su largo brazo se estira desde el Reino de los Muertos. Los espíritus de la noche se congregan y esperan dichosos su llegada.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Os vencerá a los humanos y dominará el mundo.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //Nos eclipsa y no somos más que accesorios para su poder creador.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //El amo vendrá para alzar vuestros cuerpos afligidos de las cenizas y los usará para transformar el destino del mundo.

	B_LogEntry (TOPIC_DRACHENJAGD,"Los dragones no son sus propios amos. Sirven a un amo del que no quieren que se divulgue nada que no sean vagas profecías. El amo vendrá para destruir el mundo y todo eso. Lo de siempre."); 
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_3(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_3_Condition;
	information	= DIA_DragonTalk_Main_3_Info;
	permanent	= FALSE;
	description = "¿Cómo puedo derrotar a tu amo?";
};                       

FUNC INT DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_3_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //¿Cómo puedo derrotar a tu amo?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Es todopoderoso y prácticamente invencible. No obstante, si eres lo suficientemente insensato como para enfrentarte con él, sufrirás una muerte lenta y dolorosa.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //No es la primera vez que oigo algo así. Aunque sea prácticamente invencible, puedo matarlo.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //Venga, suéltalo: ¿qué he de hacer?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Para enfrentarte a mi amo, necesitas cosas que él nunca sería capaz de obtener.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //¿Y cuáles son?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Debes hacerte con la mejor armadura de tu comunidad terrenal y ponértela sobre tu piel.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Necesitas una espada que haya sido bendecida por tu dios.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Necesitas una runa creada para ti.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Necesitas un arma forjada para ti.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Pero la condición más difícil es que debes conseguir cinco compañeros que te sigan hasta la muerte.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Solo entonces podrás atreverte a enfrentarte al amo.
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_4(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_4_Condition;
	information	= DIA_DragonTalk_Main_4_Info;
	permanent	= FALSE;
	description 	= "¿Cómo puedo encontrar a tu amo?";
};                       

FUNC INT DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_4_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //¿Cómo puedo encontrar a tu amo?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Tiene su cubil en la roca maciza de los salones de Irdorath y allí espera su destino.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Hasta que pueda restaurar el orden que se merece este mundo, allí espera meditando y...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Ahórrate los detalles. Dime dónde están los salones sagrados de Irdorath.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ja, ja, ja. Me decepcionas, hombrecillo. Has afrontado todos los peligros y casi nos vences a todos, pero no consigues aprovechar la información importante.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Si Irdorath no significa nada para ti, sería mejor que vayas a ver a los magos y les pidas que se ocupen ellos de sus asuntos mundanos.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Resulta evidente que no estás preparado para soportar la pesada carga de su conocimiento superior.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Se dice que el amo de los dragones se ha refugiado en la fortaleza rocosa de los sagrados salones de Irdorath. Mmm. Me suena. ¿Dónde he leído esto?"); 

	B_NPC_IsAliveCheck (OLDWORLD_ZEN);  //Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};


//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Main (var c_NPC slf)
{
	DIA_DragonTalk_Main_1.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc				= Hlp_GetInstanceID(slf);	
};













