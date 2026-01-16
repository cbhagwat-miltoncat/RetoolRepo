<Frame
  id="$header"
  enableFullBleed={null}
  isHiddenOnDesktop={false}
  isHiddenOnMobile={true}
  padding="8px 12px"
  sticky={true}
  style={{ map: { "primary-surface": "canvas" } }}
  type="header"
>
  <Navigation
    id="navigation1"
    data="{{ retoolContext.pages }}"
    hiddenByIndex="{{ [false, false, true, true][i] ?? false }}"
    highlightByIndex="{{ retoolContext.currentPage === item.id }}"
    labels="{{ item.title || item.id }}"
    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAcEAAABwCAMAAABRhDu+AAAAzFBMVEX/zAAAAAD/////zhT/1VH/0QD/1AD/zwBRUVEUFBQeHh7/zQrPpgb/zgD/1QCnhgCGawA9MQBpVABNPgBiTgDe3t7DnADXrAC2traZegBAQEDq6urouQCjo6NNPQChgQDIyMizs7NxcXFfX1+zjwBaSADfsgA3LAAsIwDx8fGRkZF5eXkYEwD0wwCRdADAmQAoKCjBwcGuiwAiGwA7LwB3XwCYmJimpqbh4eFsbGxGRkYxMTFaWloAABSHbACHh4cOCwD/3gDXtlJCR1Eb8CTYAAAKiElEQVR4nO2cbUPiOBDHW+/S6moLsgqysCLKg6hFgQXdXU/Xu+//na5NHzKTpkChDWQ3/1eQpC3mZ5KZyaTGX1qF6uSfI6l6Mo4NrQJln5hy9UkTLFaaoOrSBFWXJqi6NEHVpQmqLk1QdWmCqksTVF2aoOrSBFWXJqi6NEHVpQmqLk1QdWmCqksTVF2aoOrSBFWXJqi6NEHVpQmqLk1QdWmCqksTVF2aoOpSi6AlkJ1qRQStiKhyeaEiUoog+fbtlNftCY+QjIepVsNmBIbMWeWwFhfWQOFcMYRigoeLyXlrNGqdT+5+FETu6f7L9gRFN37je9x9ELSqRq2sM1D42YoKL0FhzWK3coA2/tUlS0DwqHsANVrwDQ5HLaiXsPSilaXRq2l2u9eLSSkEb13cyGmLWi0n+DmDIPipx/uKME3w7iCl77jFgqsOB9dV+rpYN+b9+6Q7eV2UQdD0cN+SXlEESQfewdhThCmCExGCr6gJz+p9NcGJefU8MSelEHzE06g1L4xgRUWCz2IG77DNiKucrENw8um8JIKc6WEJG/0xBH9kQXhibZ74utFqgofdd/P57r4Ugg8WbCNeBv8cgpkYJqzNvRjvUoLm/VX34s4shaDZhn1Lpn82wWwKrE03VXe/mqCPLry6BII9OI1ateUE+6Dw8vcjiIbXqAW/MXv0JUXoYh2CZmkE59bqNjFBMj6rxTqLXcnfiCD0E3zj5RB8ZV5hmlBrtwRN6IMPlhMUBtB+I4JggrwKvr+z7924zWtSdJ582jFBsBDiXhcQFOk3InjBep26gF8EBNk4vU4+BVPszy9U3wG5lyda9OOoDIK/fiUfpwwPsFRQcK1Mgg4JZa/POL6kgP+K/ASTsTZi8+kzuwWcec/NtAojOGOeOwiEgSZVIUECFZWlCdJaF5m13DWRHGLZg17zbV5969TbLknvlDipB/rXDHrj6vyt+di2toaYn2Diz1+ZIlTSCD48ss8JQbvBCtFfllgyvSbTNMuSIVNaDz0Pk7uGyrGOp330mIbLIx6M2QMrJLjGG4Mrxp5lbKXcBJ9AC7wQSiZoeuzjIP5HBqHMU2TT5PMm0GYF1iXocOJVU/W3dQuNKgL+0cyhZRCDj/o1ra2GYW6CzOH4DkJwr8kt5BH8YAtdRTAfNsUE1/LoUQHW54SgY4mtptM2HIakDqss0khf8HmrravcBJm5egRostC3RIJsAPSjbnUcVt0omaB9nDlQp2DDCxP8qIva97eZSHMTTPz5kW9+CljJI+iC3rDTfw3+by+coO1lNvGfxhAigpfioK3Z2SIvIDfBpOAKfmELoUSCBvvcCBGSZlJy5pZK0FkGECLEY3CY0X6L/eO8BF9RA2bKJMkYEgnCRS8EZJ0mJVOrTIKOM8tsQdWJJ0YinDdTzTcfhHkJMn8+8OLZongX30IiQWB4Rv0KRmV7q1l0lS3qiuPnQNGssCbB281XwuUEwXbhRdiCxc6CQAuLul3Ft5BIEMZAacTEZr31YNlbECS9jq8KwlTpUNGNkDSW2S+u4CFy1dcjyKeKFEYwraSebuuCMRo3kLkOgu14mnNImKtcJdsQFMVkXBBWITgdbj4gruX18MQaTYwCgv1q9Ywvq6eDOeUQZNZnOOhY+59RC6kEmXM8DvrLZYZC3d6KYPg45O+BlYpLpqq7wQByCMFcQi8vRbBpWIRYFldc2XghzEmQTZuT15ubm0O2hRhn0sgkCOIdpy62D4+dEgm6yKR8jC9wgCFlxhvPPMEQt1+OHYtU1uvaykkQNOAUp2HIJAiR+QshAOrbG+URxHuQfeb74RydS1rBEWwmra0mLN88UzwnwVaKXKxW1EImQcNl//T+QkJYkMZfhMojSFDfN8AKhk1Uap1wBNlWBMZd29gYzUkQMhu9w2+xKSOVIOhLfxoC6fYDp0SCqPkDTBm3ES5qnWCCVRgXhxVnkgjeYDzAFD04uA6bSCUIKA1dOKdaRpljUHRjKuiQRtYVJgizk91bUCGL4FdWH27qgqynbthEKkFY4gELcV4mQRxQQ4ly2MYJ/RJEcADcPmT3lEXw0/11rMPgO/PngxF3iUqiAzByCQIgjy7zLYJuLY8gujE+/IZyHU/TBGFqK3pqWQRBTIbamvGXUXDY5eQjcKBZmC28heQxyJzu6gcLiwQ2RGkEcZcN8H4u3PKd0V+4W4JgoQsI/gRkZp5vOgTme5LaFGakySUIDLpbNrkNg6rdEHwDVQ97MAY5gpHx2fU/9h1qaA1Ao3DllEvQsFgoi9ml1ITYgzG4giAMn0siGFYHOfbNOLLgBUv3C+AlmSBJZ6pEa1N56yBy6Jesg8P9I0j9+WAJrCdOkEODgaE9Q28hmaAtCv3TiORubNFvPJX9IhhBeYCpPI4b2DPUzaDmqmSC2AODvbGX/uCOCd5ES6CBd0KoPXN9EB2tkExQtJ0epnSWGJOBGYs4JoN6s753BJ/pEjh2+c1IK7Jn6IaTbIL4sDvophLHIHpkrrjoLgk++6tdME0+uumbEC8IELXoQiibYPqwUjQqiiZoZMSkwd6Ejfcm6I32h+C7aR6Z5i+UzZrIsak9ExCWTTB9bj6CVQBBtJHbANMotFfMXrI/SNC+oWh/UCZBGvcEOGj9pZGRDBDaM0/mLgjyWexRwkIBBGHCvDk8tuIsC1zhT0vBqSWHOHhJtgV79DIJjvB3aqVUl2T4u9E/rHSCXHcm0932BPn3fNTGzeacGpgWzpOpNQzX8rgD/BVRnkzpBOEZ3pebQ/ZuGRoV7QmWQPCDwh6TTpDPvY2PpmxPUPhaDJohT1a/jW4WH5aSSxAe34SiI3Cw4iGhPSOdIPaiWfLs9gSFZ4bDMw4uP3WnNBDmi5ZOMONdFkHM+tRbmcnhOIGjdCWbIBmj4jhQWQBBK5UUGBN0nNt0FVRFnLNdPkFRJtMoMFDm6xxyc6wgNP9VMkGMKvHbihiD/BJrJueMHI9P8UXKODchgaBgEFI/fbp0CWSi9sy1XIK4OHk1SQEE+czeQPFJMdsTvQQz0lvG2SUZBFMrIfULG2vfn9ozP+QSRFR6BY5Bw06/2yQ56+cY/VRlpMzzgzIImjgBjZ5vGa5eAsEv9ma+79+SOgahHZ8cQCiCoMDoZKc1HVf4HsxlZ3ilEATny/wlMMiln+d73QKwZyQRhFY/OwSUQVB4jj4754h4cNfdxOdtyTE2oii/Oo4b47UUEYRP3fwYr+gtzYsWnAWnHySnaHwmOGP/kr73VgTtDhQMNSdiJ0icNmwcl4enkjrgHBJfyL2u1CGkUan2L4ez2Wm/Nn9D+4EOcR5hMHv2Nki9y6LdqSTqwCNKwp+yQacIfdOf93eLxYKeCaz1KrnVC+aH73f0bZRFEhS+DAaXg6gfepGLvfQWWfeN+ogkr/ISvU+GtB87zfFbc3riuYLpCv0MPDyXPnVdKfWu+z3VBu90KlCaoOrSBFWXJqi6NEHVpQmqLk1QdWmCqksTVF2aoOrSBFWXJqi6NEHVpQmqLk1QdWmCqksTVF2aoOrSBFWXJqi6NEHVpQmqLk1QdWmCqksTVF2aoOrSBFXXDghqFSpHNsEj42+tQvXvf4dS9fo/t4lMKZ71QywAAAAASUVORK5CYII="
  >
    <Option id="00030" icon="bold/interface-home-3" label="Home" />
    <Option id="00031" icon="bold/interface-user-multiple" label="Customers" />
    <Option id="00032" icon="bold/interface-setting-cog" label="Settings" />
    <Event
      id="2605456c"
      event="click"
      method="openPage"
      params={{ map: { pageName: "{{ item.id }}" } }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Navigation>
  <Avatar
    id="avatar1"
    fallback="{{ current_user.fullName }}"
    imageSize={32}
    label="{{ current_user.fullName }} "
    src="{{ current_user.profilePhotoUrl }}"
    style={{ map: { background: "automatic" } }}
  />
</Frame>
