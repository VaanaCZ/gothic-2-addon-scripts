// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCVLK_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCVLK_1_EXIT_Condition;
	information	= DIA_OCVLK_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCVLK_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************

INSTANCE DIA_OCVLK_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCVLK_1_PEOPLE_Condition;
	information	= DIA_OCVLK_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "�Qui�n est� al mando?";
};                       

FUNC INT DIA_OCVLK_1_PEOPLE_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_1_PEOPLE_15_00"); //�Qui�n est� al mando?
	AI_Output (self, other, "DIA_OCVLK_1_PEOPLE_01_01"); //El comandante Garond, aunque desde que ha empeorado la situaci�n, no se le ha visto salir del sal�n del trono. Me temo que la cosa va a acabar mal.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCVLK_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCVLK_1_LOCATION_Condition;
	information	= DIA_OCVLK_1_LOCATION_Info;
	permanent	= TRUE;
	description = "�Qu� sabes del Valle de las Minas?";
};                       

FUNC INT DIA_OCVLK_1_LOCATION_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_1_LOCATION_15_00"); //�Qu� sabes del Valle de las Minas?
	AI_Output (self, other, "DIA_OCVLK_1_LOCATION_01_01"); //Que yo sepa, algunos de los nuestros est�n en las minas y siguen prospectando.
	AI_Output (self, other, "DIA_OCVLK_1_LOCATION_01_02"); //No me gustar�a estar en su lugar. Todo el valle est� infestado de orcos, por no mencionar a los dragones.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCVLK_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCVLK_1_STANDARD_Condition;
	information	= DIA_OCVLK_1_STANDARD_Info;
	permanent	= TRUE;
	description = "�C�mo van las cosas?";
};                       
func INT DIA_OCVLK_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_1_STANDARD_15_00"); //�C�mo van las cosas?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_01"); //�Los orcos nos tienen donde quieren! Sin refuerzos, no va a quedar ning�n superviviente. Me sorprende que los dragones no nos hayan aniquilado.
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_02"); //Por lo menos vamos a recibir refuerzos.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_03"); //�Dices que han muerto todos los dragones? �Gracias a Innos!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_04"); //Maldito mineral. Deber�amos tirar por las almenas todas las reservas de mineral. Con eso, a lo mejor conseguimos que los orcos nos dejen en paz.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_05"); //�Estas cajas rid�culas que han apilado al tun tun delante de la entrada no van a servir para detener a los orcos!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCVLK_1 (var c_NPC slf)
{
	DIA_OCVLK_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_PEOPLE.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
