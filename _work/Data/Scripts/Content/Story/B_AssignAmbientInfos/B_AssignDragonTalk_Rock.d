// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Rock_Exit_Condition;
	information	= DIA_Dragon_Rock_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Rock_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Rock_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //Dość gadania. Oko straciło swą ochronną moc. Przygotuj się na śmierć.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Rock_Hello_Condition;
	information	= DIA_Dragon_Rock_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Rock_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Rock_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //Jeszcze jeden zadufany w sobie karzeł, który ośmielił się wspiąć na moją skałę... Ach, ludzie. Tacy waleczni... i tacy wątli.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //Ej, ty mówisz!
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //Wypatroszę cię i rzucę twoje wnętrzności ścierwojadom.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //Nie tak szybko! Mam tu Oko Innosa. Odpowiesz mi najpierw na moje pytania.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //Aaargh. Pytaj więc!

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Rock_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Rock_WERBISTDU_Info;

	description	 = 	"Kim jesteś?";
};

func int DIA_Dragon_Rock_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //Kim jesteś?
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //Nazywam się Pedrakhan. Jak cię dopadnę, obedrę żywcem ze skóry!

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"Który z was, smoków, jest najpotężniejszy?";
};

func int DIA_Dragon_Rock_HIERARCHIE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //Który z was, smoków, jest najpotężniejszy?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //Czerpiemy naszą moc z żywiołów waszego świata. Ich hierarchia jest bardzo prosta.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //Miękka ziemia obdarza życiem wszystkie istoty pod słońcem, ale otworzy się i pochłonie cię, jeśli zbliżysz się do niej za bardzo.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //Skała, która prędzej pęknie, niż się podda, wznosi się dumnie ku niebu, by pogrzebać pod sobą nieostrożnych. A mimo to jest przecież najlepszą ochroną przed falą przypływu.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //Iskra życia płonie w huczącym ogniu tego świata. A przecież ogień spala całe życie, pozostawiając po nim ledwie garstkę popiołu.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //Wszystkie żywioły mają moc tworzenia i niszczenia. Ale tylko w wodzie, która stała się twarda jak skała, wszystko stanie się słupem soli, na którym życie jest niemożliwe.

};


//**********************************************************************************
//		B_AssignDragonTalk_Rock
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Rock (var c_NPC slf)
{
	DIA_Dragon_Rock_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






