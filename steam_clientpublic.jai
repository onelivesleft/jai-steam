CSteamID :: u64;

EGameIDType :: enum {
    k_EGameIDTypeApp        :: 0;
    k_EGameIDTypeGameMod    :: 1;
    k_EGameIDTypeShortcut   :: 2;
    k_EGameIDTypeP2P        :: 3;
}

GameID_t :: u64;

QUERY_PORT_NOT_INITIALIZED ::  0xFFFF;    // We haven't asked the GS for this query port's actual value yet.
QUERY_PORT_ERROR           ::  0xFFFE;    // We were unable to get the query port for this server.

ValvePackingSentinel_t :: struct {
    m_u32 : uint32;
    m_u64 : uint64;
    m_u16 : uint16;
    m_d : double;
}
