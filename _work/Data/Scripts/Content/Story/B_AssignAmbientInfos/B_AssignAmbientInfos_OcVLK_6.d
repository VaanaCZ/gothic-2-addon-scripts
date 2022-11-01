// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCVLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCVLK_6_EXIT_Condition;
	information	= DIA_OCVLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCVLK_6_PEOPLE_Condition;
	information	= DIA_OCVLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién está al mando?";
};                       

FUNC INT DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_PEOPLE_15_00"); //¿Quién está al mando?
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_01"); //Garond está al mando de todo el fuerte... o de lo que queda de él.
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_02"); //Pero no se ocupa de casi nada... salvo cuando uno de los suyos se mete en algún lío.
	if (Npc_IsDead (Engor) == FALSE)
	{
		AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_03"); //Si quieres equipo, tendrías que haber ido a ver a Engor. Lo encontrarás en la casa que está enfrente de la de Garond.
	};
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCVLK_6_LOCATION_Condition;
	information	= DIA_OCVLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "¿Qué puedes contarme de la situación del Valle de las Minas?";
};                       

FUNC INT DIA_OCVLK_6_LOCATION_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_LOCATION_15_00"); //¿Qué puedes contarme de la situación del Valle de las Minas?
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_01"); //Me preocupa la muralla protectora de los orcos. No quiero imaginarme lo que esconden allí detrás.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_02"); //Al principio solo había unos pocos y construyeron la muralla. Luego, una noche, trajeron las máquinas de asedio.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_03"); //Tuvimos suerte y conseguimos repeler el ataque.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_04"); //Tras la muralla está el mar. Si llegan más orcos en otros barcos, no tendremos ninguna oportunidad.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCVLK_6_STANDARD_Condition;
	information	= DIA_OCVLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Qué tal va todo?";
};                       
func INT DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_STANDARD_15_00"); //¿Cómo va todo?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_01"); //Dicen que una vez que te enrolas en el ejército, te das a la buena vida. Fíjate.
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_02"); //Ahora está prohibido, so pena de muerte, acercarse siquiera a las provisiones. Parece que Garond tiene miedo de que asaltemos las vituallas y nos larguemos (risa amarga).
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_03"); //¡Nos vamos a morir de hambre, si es que no nos matan antes esos malditos dragones!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_04"); //Cazadores de dragones. ¡No me hagas reír! No van a cambiar nada.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_05"); //¡Se dice que los dragones han muerto! ¡Ahora sí tenemos alguna oportunidad!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_06"); //Maldito mineral. Deberíamos tirar por las almenas todas las reservas de mineral. Con eso, a lo mejor conseguimos que los orcos nos dejen en paz.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_07"); //¡Estas cajas ridículas que han apilado al tun tun delante de la entrada no van a servir para detener a los orcos!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCVLK_6 (var c_NPC slf)
{
	DIA_OCVLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
